import 'package:flutter/material.dart';

class LatestNews extends StatelessWidget{
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Latest News',
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
                          children: [
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.thumb_up_alt_outlined,
                                semanticLabel: '2.1k', 
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.timelapse_outlined,
                                semanticLabel: '1hr ago', 
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.bookmark_border_outlined,
                                color: Color.fromARGB(237,56,106,255),
                              ),
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
                          children: [
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.thumb_up_alt_outlined,
                                semanticLabel: '2.1k', 
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.timelapse_outlined,
                                semanticLabel: '1hr ago', 
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.bookmark_border_outlined,
                                color: Color.fromARGB(237,56,106,255),
                              ),
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
      )
    );
  }
}