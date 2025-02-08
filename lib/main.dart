import 'package:blog_club/components/on_boarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
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