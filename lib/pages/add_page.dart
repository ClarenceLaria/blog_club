import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, this.article});

  final Map<String, dynamic>? article;
  
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

  var uuid = const Uuid();

  final QuillController _controller = QuillController.basic();
  final TextEditingController _titleController = TextEditingController();
  File? _image;
  String? _selectedCategory;
  String? _articleId;

  @override
  void initState() {
    super.initState();
    if (widget.article != null) {
      _articleId = widget.article!['id'];
      _titleController.text = widget.article!['title'];
      // _controller.document = Document()..insert(0, widget.article!['description']);

      try {
        if (widget.article!['description'] != null) {
          List<dynamic> deltaJson = jsonDecode(widget.article!['description']);
          _controller.document = Document.fromJson(deltaJson);
        } else {
          _controller.document = Document(); // Use an empty document if null
        }
      } catch (e) {
        print("Error parsing JSON: $e");
        _controller.document = Document(); // Prevent crash
      }

      _selectedCategory = widget.article!['category'];

      if (widget.article!['imagePath'] != null) {
        _image = File(widget.article!['imagePath']);
      }
    }
  }

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

      // Generate a unique name for the image using timestamps + random number
      final String uniqueFileName = 'user_image_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}.jpg';

      final String imagePath = '${directory.path}/$uniqueFileName';

      await imageFile.copy(imagePath);
      return imagePath;
    }

  //Hive implementation
  Future<void> saveData() async {
    final box = Hive.box('userBox');
    List<dynamic> storedArticles = List.from(box.get('articles', defaultValue: []));

    String title = _titleController.text;
    String description = jsonEncode(_controller.document.toDelta().toJson());
    String category = _selectedCategory ?? 'No Category';
    String imagePath = _image != null ? await saveImage(_image!) : '';

    if(_articleId == null) {
      _articleId = uuid.v4();
      storedArticles.add({
        'id': _articleId,
        'createdAt': DateTime.now().toIso8601String(),
        'title': title,
        'description': description,
        'category': category,
        'imagePath': imagePath,
      });
    } else {
      int index = storedArticles.indexWhere((article) => article['id'] == _articleId);
      if (index != -1) {
        storedArticles[index] = {
          'id': _articleId,
          'createdAt': storedArticles[index]['createdAt'],
          'title': title,
          'description': description,
          'category': category,
          'imagePath': imagePath,
        };
      }
    }
    await box.put('articles', storedArticles);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data Saved Successfully')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _articleId == null ? 'New Article' : 'Edit Article',
                      style: const TextStyle(
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
    );
  }
}