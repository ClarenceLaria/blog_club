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
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter a Blog Title',
                    // border: OutlineInputBorder(),
                  ),
                  maxLength: 100,
                  maxLines: null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField(
                  items: items, 
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    hintText: 'Select a Category',
                    // border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}