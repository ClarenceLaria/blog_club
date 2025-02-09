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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView(
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
                      // const SizedBox(height: 10),
                      // DropdownButtonFormField(
                      //   items: items, 
                      //   onChanged: (value) {},
                      //   decoration: const InputDecoration(
                      //     labelText: 'Category',
                      //     hintText: 'Select a Category',
                      //     // border: OutlineInputBorder(),
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      QuillSimpleToolbar(
                        controller: _controller,
                        configurations: const QuillSimpleToolbarConfigurations(
                          toolbarIconAlignment: WrapAlignment.start,
                          toolbarIconCrossAlignment: WrapCrossAlignment.start,
                          toolbarSectionSpacing: kToolbarSectionSpacing/20,
                          multiRowsDisplay: false,
                          showDividers: false,
                          showFontFamily: false,
                          showFontSize: false,
                          showBoldButton: true,
                          showItalicButton: true,
                          showSmallButton: false,
                          showUnderLineButton: false,
                          showLineHeightButton: false,
                          showStrikeThrough: false,
                          showInlineCode: false,
                          showColorButton: false,
                          showBackgroundColorButton: false,
                          showClearFormat: false,
                          showAlignmentButtons: true,
                          showLeftAlignment: true,
                          showCenterAlignment: false,
                          showRightAlignment: false,
                          showJustifyAlignment: false,
                          showHeaderStyle: true,
                          showListNumbers: true,
                          showListBullets: true,
                          showListCheck: false,
                          showCodeBlock: false,
                          showQuote: false,
                          showIndent: false,
                          showLink: true,
                          showUndo: true,
                          showRedo: true,
                          showDirection: false,
                          showSearchButton: false,
                          showSubscript: false,
                          showSuperscript: false,
                          showClipboardCut: true,
                          showClipboardCopy: true,
                          showClipboardPaste: true,
                        ),
                      ),
                      Expanded(
                        child: QuillEditor.basic(
                          controller: _controller,
                          // focusNode: FocusNode(),
                          configurations: const QuillEditorConfigurations(),
                        ),
                      )
                    ],
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