import 'package:blog_club/custom_widgets/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 5),);
  FlutterNativeSplash.remove();
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