import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
                        onPressed: () {}, 
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
                            decoration: const InputDecoration(
                              labelText: 'Title',
                              hintText: 'Enter a Blog Title',
                              // border: OutlineInputBorder(),
                            ),
                            maxLength: 100,
                            maxLines: null,
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            items: items, 
                            onChanged: (value) {},
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
                          )
                          
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