import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:io';

class LatestNews extends StatefulWidget{
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  _LatestNewsState();

  List<Map<String, dynamic>> articles = [];

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    final box = Hive.box('userBox');
    final List<dynamic>? storedArticles = box.get('articles', defaultValue: []);

    setState(() {
      articles = storedArticles?.cast<Map<String, dynamic>>() ?? [];
    });
  }

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
            articles.isEmpty 
              ? const Center(child: Text("No saved articles"))
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: article['imagePath'] != null && File(article['imagePath']).existsSync()
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(article['imagePath']),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(Icons.image_not_supported, size: 50),
                        title: Text(
                          article['title'] ?? "No Title",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          article['description'] ?? "No Description",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            // Remove the article from Hive and update the list
                            final box = Hive.box('userBox');
                            List<dynamic> storedArticles = box.get('articles', defaultValue: []);
                            storedArticles.removeAt(index);
                            await box.put('articles', storedArticles);

                            setState(() {
                              articles.removeAt(index);
                            });
                          },
                        ),
                        onTap: () {
                          // Navigate to article details page (optional)
                        },
                      ),
                    );
                  },
                ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: Row(
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(20),
            //         child: const Image(
            //           image: AssetImage('assets/images/on_boarding_images/technology_vr.jpg'),
            //           height: 150,
            //           width: 100,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       const SizedBox(width: 20,),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const Text(
            //               'BIG DATA',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 color: Color.fromARGB(255,56,106,237),
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             const SizedBox(height: 10,),
            //             const Text(
            //               'Why Big Data Needs Thick Data?',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             const SizedBox(height: 10,),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Column(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         Icons.thumb_up_alt_outlined,
            //                         size: 18,
            //                       ),
            //                     ),
            //                     const Text(
            //                       '2.1k',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: Colors.black,
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Column(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         Icons.timelapse_outlined,
            //                         size: 18,
            //                       ),
            //                     ),
            //                     const Text(
            //                       '1hr ago',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: Colors.black,
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         size: 18,
            //                         Icons.bookmark_border_outlined,
            //                         color: Color.fromARGB(237,56,106,255),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: Row(
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(20),
            //         child: const Image(
            //           image: AssetImage('assets/images/on_boarding_images/technology_vr.jpg'),
            //           height: 150,
            //           width: 100,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       const SizedBox(width: 20,),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const Text(
            //               'BIG DATA',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 color: Color.fromARGB(237,56,106,255),
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             const SizedBox(height: 10,),
            //             const Text(
            //               'Why Big Data Needs Thick Data?',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 color: Colors.black,
            //               ),
            //             ),
            //             const SizedBox(height: 10,),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Column(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         Icons.thumb_up_alt_outlined,
            //                         size: 18,
            //                       ),
            //                     ),
            //                     const Text(
            //                       '2.1k',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: Colors.black,
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Column(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         Icons.timelapse_outlined,
            //                         size: 18,
            //                       ),
            //                     ),
            //                     const Text(
            //                       '1hr ago',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                         color: Colors.black,
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     IconButton(
            //                       onPressed: () {}, 
            //                       icon: const Icon(
            //                         size: 18,
            //                         Icons.bookmark_border_outlined,
            //                         color: Color.fromARGB(237,56,106,255),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}