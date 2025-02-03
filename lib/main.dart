import 'package:flutter/material.dart';
import 'package:blog_club/landing.dart';

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

  @override
  Widget build(BuildContext context){
    return const Landing();
  }
}