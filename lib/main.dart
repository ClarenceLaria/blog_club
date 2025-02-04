import 'package:flutter/material.dart';
import 'package:blog_club/components/on_boarding.dart';

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
  State<BlogClubPage> createState() {
    return _BlogClubPageState();
  }
}

class _BlogClubPageState extends State<BlogClubPage>{
  _BlogClubPageState();

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
          const OnBoarding(),
        ],
      ),
    );
  }
}