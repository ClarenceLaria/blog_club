import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class Articles extends StatefulWidget {
  const Articles({super.key, required this.article});

  final Map<String, dynamic> article;

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  String title = '';
  String createdAt = '';
  String descriptionJson = '';
  String category = '';
  String? imagePath;
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  String formatDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return 'Unknown Date';
  }
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('MMMM d yyyy').format(date); // "March 10 2024"
  } catch (e) {
    return 'Unknown Date';
  }
  }

  Future<void> loadData() async {
    final box = Hive.box('userBox');
    setState(() {
      title = widget.article['title'] ?? box.get('title', defaultValue: 'No Title');
      createdAt = formatDate(widget.article['createdAt'] ?? box.get('createdAt', defaultValue: 'Unknown Date'));
      category = widget.article['category'] ?? box.get('category', defaultValue: 'No Category');
      imagePath = widget.article['imagePath'] ?? box.get('imagePath');
      // description = widget.article['description'] ?? box.get('description', defaultValue: 'No Description');
      descriptionJson = widget.article['description'] ?? box.get('description', defaultValue: 'No Description');
        Document doc = Document.fromJson(jsonDecode(descriptionJson));
        _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0), readOnly: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () => Navigator.pop(context), // Fixed back button
                    //       icon: const Icon(Icons.arrow_back_ios),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.more_horiz),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (imagePath != null && File(imagePath!).existsSync()) // Fixed image display
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(imagePath!),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              )
                            else
                              const Icon(Icons.image_not_supported, size: 40),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Jane Doe',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  createdAt,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Color.fromARGB(255,56, 106, 237),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_border,
                                color: Color.fromARGB(255,56, 106, 237),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    if (imagePath != null && File(imagePath!).existsSync()) // Fixing the article image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.file(
                          File(imagePath!),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    const SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Text(
                          //   descriptionJson,
                          //   style: const TextStyle(
                          //     fontSize: 14,
                          //     height: 1.5,
                          //   ),
                          // ),
                          QuillEditor.basic(
                            controller: _controller,
                            configurations: const QuillEditorConfigurations(checkBoxReadOnly: true), // Read-only mode for viewing
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
