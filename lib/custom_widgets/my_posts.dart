import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  const MyPost({super.key});

  @override
  Widget build (BuildContext context){
    return Container(
      height: 300,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Posts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {}, 
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(left: 5.0),
                  ),
                  child: const Text(
                    'More',
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(237,56,106,255)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage('assets/images/on_boarding_images/technology_vr.jpg'),
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'BIG DATA',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(237,56,106,255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text(
                                'Why Big Data Needs Thick Data?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          Icons.thumb_up_alt_outlined,
                                          size: 18,
                                        ),
                                      ),
                                      const Text(
                                        '2.1k',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          Icons.timelapse_outlined,
                                          size: 18,
                                        ),
                                      ),
                                      const Text(
                                        '1hr ago',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          size: 18,
                                          Icons.bookmark_border_outlined,
                                          color: Color.fromARGB(237,56,106,255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage('assets/images/on_boarding_images/technology_vr.jpg'),
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'BIG DATA',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(237,56,106,255),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              const Text(
                                'Why Big Data Needs Thick Data?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          Icons.thumb_up_alt_outlined,
                                          size: 18,
                                        ),
                                      ),
                                      const Text(
                                        '2.1k',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          Icons.timelapse_outlined,
                                          size: 18,
                                        ),
                                      ),
                                      const Text(
                                        '1hr ago',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {}, 
                                        icon: const Icon(
                                          size: 18,
                                          Icons.bookmark_border_outlined,
                                          color: Color.fromARGB(237,56,106,255),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}