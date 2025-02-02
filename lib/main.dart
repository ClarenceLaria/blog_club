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
  bool passwordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
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
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
            panel: Column(
              children: [
                const SizedBox(height: 10,),
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
                  child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                  TextButton(onPressed: () {
                    setState(() {
                      selectedTab = 'Sign-up';
                    });
                    _panelController.open();
                  },
                  child: const Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ],
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))        
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: selectedTab == 'Login' ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: _buildLoginFields(togglePasswordVisibility, passwordVisible)) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: _buildSignUpFields()),
                    )
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
List<Widget> _buildLoginFields(void Function() togglePasswordVisibility, bool passwordVisible) {
  return [
    const Text(
      'Welcome back',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Sign in with your account',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    ),
    const SizedBox(height: 20),
    const TextField(
      decoration: InputDecoration(labelText: 'Username'),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    const SizedBox(height: 10),
    TextField(
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: TextButton(
          onPressed: togglePasswordVisibility, 
          child: Text(
            passwordVisible ? 'Hide' : 'Show',
            style: const TextStyle(color: Color.fromARGB(255,56, 106, 237)),
          ),
        )
      ),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    const SizedBox(height: 30),
    SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          backgroundColor: const Color.fromARGB(255,56, 106, 237),
        ),
        child: const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 22,),),
        ),
      ),
    ),
    const SizedBox(height: 20,),
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Forgot your password?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.only(left: 5.0),
            ),
            child: const Text(
              'Reset here',
              style: TextStyle(color:Color.fromARGB(255,56, 106, 237), fontSize: 17, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
         const Text(
                'OR SIGN IN WITH',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/google.png', width: 60, height: 60,),
              Image.asset('assets/images/facebook.png', width: 60, height: 60,),
              Image.asset('assets/images/twitter.png', width: 60, height: 60,),
            ],
          ),
        ),
        ],
      ),
    ),
  ];
}

List<Widget> _buildSignUpFields() {
  return [
    const Text(
      'Sign Up',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Create an account',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
    const SizedBox(height: 30),
    SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          backgroundColor: const Color.fromARGB(255,56, 106, 237),
        ),
        child: const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 22,),),
        ),
      ),
    ),
  ];
}