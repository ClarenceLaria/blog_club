import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
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
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 20), 
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
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
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: const Color.fromARGB(237,56,106,255)
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage('assets/images/face.webp'),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Richard',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: const Color.fromARGB(237,56,106,255)
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage('assets/images/face.webp'),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Richard',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: const Color.fromARGB(237,56,106,255)
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage('assets/images/face.webp'),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Richard',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2.0,
                                      color: const Color.fromARGB(237,56,106,255)
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: const Image(
                                        image: AssetImage('assets/images/face.webp'),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                const Text(
                                  'Richard',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: const AssetImage('assets/images/on_boarding_images/turtle.webp'),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}