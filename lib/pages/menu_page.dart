import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  _MenuPageState();

  int activeIndex = 0;
  
  @override
  Widget build (BuildContext context){
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
                      'Profile',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: const Icon(
                        Icons.more_horiz,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20,),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      height: 270,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.0,
                                    color: const Color.fromARGB(255, 56, 106, 237)
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                        'assets/images/face4.webp',  
                                      ),
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@janedoe',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Jane Doe',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'UX DESIGNER',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 56, 106, 237),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Me',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  'Jane Doe is a UX Designer with a passion for designing beautiful and functional user experiences.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.57,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 56, 106, 237),
                        border: Border.all(
                          width: 2.0,
                          color: const Color.fromARGB(255, 56, 106, 237),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(3, (index) {
                          Color activeColor = const Color.fromARGB(255, 32, 81, 203);
                          Color inactiveColor = const Color.fromARGB(255, 56, 106, 237);
                          return TextButton(
                            onPressed: () {
                              setState(() {
                                activeIndex = index;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: activeIndex == index ? activeColor : inactiveColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  index == 0 ? '52' : index == 1 ? '250' : '4.5K',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  index == 0 ? 'Posts' : index == 1 ? 'Following' : 'Followers',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ), 
      ),
    );
  }
}