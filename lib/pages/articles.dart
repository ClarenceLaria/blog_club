import 'package:flutter/material.dart';

class Articles extends StatelessWidget{
  const Articles({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {}, 
                          icon: const Icon(
                            Icons.arrow_back_ios,
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
                    const SizedBox(height: 20),
                    const Text(
                      'Four Things Every Woman Needs To Know',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/face4.webp'  
                                ),
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jane Doe',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'March 16, 2021',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.share,
                                color: Color.fromARGB(233, 56,106,255),
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.bookmark_border,
                                color: Color.fromARGB(233, 56,106,255),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: ListView(
                  children: const [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      child: Image(
                        image: AssetImage(
                          'assets/images/face3.webp'  
                        ),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Column(
                        children: [
                          Text(
                            "A man's sexuality is never your mind responsibility.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),   
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Nulla nec purus feugiat, molestie ipsum et, consequat nibh.',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}