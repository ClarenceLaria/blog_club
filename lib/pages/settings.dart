import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255,56,106,237).withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark mode', 
                  style: TextStyle(
                    // fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CupertinoSwitch(
                  activeColor: const Color.fromARGB(255,56,106,237),
                  value: true, 
                  onChanged: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}