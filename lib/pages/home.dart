import 'package:flutter/material.dart';
import 'package:blog_club/constants/stories_list.dart';
import 'package:blog_club/custom_widgets/latest_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  final storiesList = stories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi, Clarence!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none, // Allows the red dot to overflow the Stack
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                      ),
                      Positioned(
                        left: 3,
                        top: 4,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "Explore today's",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: storiesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                          child: Column(
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
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(
                                        storiesList[index]['image']!,  
                                      ),
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                storiesList[index]['name']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.66,
              child: ListView(
                children: [
                  SizedBox(
                    height: 320,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, bottom: 20, top: 20),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
                          children: [
                            Container(
                              height: 250,
                              width: 200,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(0, 5)
                                  ),
                                  BoxShadow(
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                    color: Colors.white,
                                    offset: Offset(-5, 0)
                                  ),
                                  BoxShadow(
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                    color: Colors.white,
                                    offset: Offset(5, 0)
                                  ),
                                ]
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage('assets/images/on_boarding_images/turtle.webp'),
                                      height: 250,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                    child: const Text(
                                      'Adventure',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: 250,
                                width: 200,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5,
                                      offset: Offset(0, 5)
                                    ),
                                    BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      color: Colors.white,
                                      offset: Offset(-5, 0)
                                    ),
                                    BoxShadow(
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      color: Colors.white,
                                      offset: Offset(5, 0)
                                    ),
                                  ]
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage('assets/images/on_boarding_images/turtle.webp'),
                                        height: 250,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                      child: const Text(
                                        'Adventure',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const LatestNews(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}