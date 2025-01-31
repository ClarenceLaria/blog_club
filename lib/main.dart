import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlogClubPage(),
    );
  }
}

class BlogClubPage extends StatefulWidget{
  const BlogClubPage ({super.key});

  @override
  _BlogClubPageState createState() => _BlogClubPageState();
}

class _BlogClubPageState extends State<BlogClubPage>{
  _BlogClubPageState();

  double sheetOpacity = 0.0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255,56, 106, 237),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'BLOG',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        letterSpacing: 8.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
              'CLUB',
              style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255,56, 106, 237),
              letterSpacing: 8.0,
              ),
            ),
                  )
              ],
            )
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: const Color.fromARGB(255,56, 106, 237).withOpacity(sheetOpacity),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    setState(() {
                      if(notification.extent <= 0.1){
                        sheetOpacity = 0.0;
                      } else if(notification.extent >= 0.8){
                        sheetOpacity = 1.0;
                      } else {
                        sheetOpacity = notification.extent;
                      }
                    });
                    return true;
                  },
                child: ListView(
                  controller: scrollController,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        // border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        // border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              );
            },
          )
        ],
      ),
    );
  }
}