import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() {
    return _AddPageState();
  }
}

class _AddPageState extends State<AddPage> {
  _AddPageState();

  final List<DropdownMenuItem<String>> items = const[
    DropdownMenuItem(value: 'Category1', child: Text('Category1')),
    DropdownMenuItem(value: 'Category2', child: Text('Category2')),
    DropdownMenuItem(value: 'Category3', child: Text('Category3')),
  ];

  final QuillController _controller = QuillController.basic();
  final TextEditingController _titleController = TextEditingController();
  File? _image;
  String? _selectedCategory;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Choose an option'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: const Text('Gallery'),
            ),
          ],
        ),
      ) ?? ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

    Future<String> saveImage(File imageFile) async {
      final directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/user_image.jpg';
      await imageFile.copy(imagePath);
      return imagePath;
    }

  //Hive implementation
  Future<void> saveData() async {
    final box = Hive.box('userBox');
    List<dynamic> storedArticles = List.from(box.get('articles', defaultValue: []));

    String title = _titleController.text;
    String description = _controller.document.toPlainText();
    String category = _selectedCategory ?? 'No Category';
    String imagePath = _image != null ? await saveImage(_image!) : '';

    storedArticles.add({
      'title': title,
      'description': description,
      'category': category,
      'imagePath': imagePath,
    });
    await box.put('articles', storedArticles);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data Saved Successfully')),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Article',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: saveData, 
                        icon: const Icon(
                          Icons.save_alt,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              hintText: 'Enter a Blog Title',
                              // border: OutlineInputBorder(),
                              suffix: IconButton(
                                onPressed: pickImage, 
                                icon: const Icon(Icons.image),
                              ),
                            ),
                            maxLength: 100,
                            maxLines: null,
                          ),
                          const SizedBox(height: 10),
                          //Image
                          _image != null
                            ? Image.file(_image!, height: 150, width: 150,) // Displays the selected image
                            : const Text("No image selected"),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            items: items, 
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value!;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Category',
                              hintText: 'Select a Category',
                              // border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          QuillSimpleToolbar(
                            controller: _controller,
                            configurations: QuillSimpleToolbarConfigurations(
                              decoration: BoxDecoration(
                                // color:  const Color.fromARGB(255,15, 23, 42),
                                border: Border.all(color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              // buttonOptions: const QuillSimpleToolbarButtonOptions(
                              //   base: QuillToolbarBaseButtonOptions(
                              //     iconTheme: QuillIconTheme(iconButtonSelectedData: IconButtonData(color: Colors.white), iconButtonUnselectedData: IconButtonData(color: Colors.white)),
                              //   ),
                              // ),
                              toolbarIconAlignment: WrapAlignment.start,
                              toolbarIconCrossAlignment: WrapCrossAlignment.start,
                              toolbarSectionSpacing: kToolbarSectionSpacing/20,
                              multiRowsDisplay: false,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 400,
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.black26, width: 2.0)),
                            ),
                            child: QuillEditor.basic(
                              controller: _controller,
                              // focusNode: FocusNode(),
                              configurations: const QuillEditorConfigurations(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}