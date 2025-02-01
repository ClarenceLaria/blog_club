import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  String selectedTab = 'Login';
  final PanelController _panelController = PanelController();

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
          SlidingUpPanel(
            controller: _panelController,
            minHeight: 50,
            panel: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  TextButton(onPressed: () {
                    setState(() {
                      selectedTab = 'Login';
                    });
                    _panelController.open();
                  }, 
                  child: const Text('LOGIN', style: TextStyle(color: Colors.white),),
                  ),
                  TextButton(onPressed: () {
                    setState(() {
                      selectedTab = 'Sign-up';
                    });
                    _panelController.open();
                  }, 
                  child: const Text('SIGN UP', style: TextStyle(color: Colors.white),),
                  ),
                ],
                ),
                Expanded(
                  child: ListView(
                    children: selectedTab == 'Login' ? _buildLoginFields() : _buildSignUpFields(),
                  ),
                ),
              ],
            ),
            color: const Color.fromARGB(255,56, 106, 237),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildLoginFields() {
  return [
    const Text(
      'Login',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    const SizedBox(height: 20),
    const TextField(
      decoration: InputDecoration(labelText: 'Email'),
    ),
    const SizedBox(height: 10),
    const TextField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
    ),
    const SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Login'),
    ),
  ];
}

List<Widget> _buildSignUpFields() {
  return [
    const Text(
      'Sign Up',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    const SizedBox(height: 20),
    const TextField(
      decoration: InputDecoration(labelText: 'Full Name'),
    ),
    const SizedBox(height: 10),
    const TextField(
      decoration: InputDecoration(labelText: 'Email'),
    ),
    const SizedBox(height: 10),
    const TextField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
    ),
    const SizedBox(height: 10),
    const TextField(
      decoration: InputDecoration(labelText: 'Confirm Password'),
      obscureText: true,
    ),
    const SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Sign Up'),
    ),
  ];
}