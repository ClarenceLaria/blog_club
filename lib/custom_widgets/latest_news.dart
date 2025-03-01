import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:blog_club/pages/articles.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:blog_club/pages/add_page.dart';
import 'package:blog_club/api/api_service.dart';

class LatestNews extends StatefulWidget{
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  _LatestNewsState();

  List<dynamic> articles = [];

//   Future<void> loadArticles() async {
//   try {
//     final box = Hive.box('userBox');
//     List<dynamic> storedArticles = box.get('articles', defaultValue: []);
//     print('Retrieved articles: $storedArticles'); 

//     setState(() {
//       articles = storedArticles.map((item) => Map<String, dynamic>.from(item)).toList();
//     });
//   } catch (e, stacktrace) {
//     print("Error loading articles: $e");
//     print(stacktrace);
//   }
// }
  
  Future<void> fetchArticles() async {
    try{
    final fetchedPosts = await ApiService.getPosts();
    setState(() {
      articles = fetchedPosts;
    });
  } catch (e) {
    print("Error loading articles: $e");
  }
  }

  String formatTimeAgo(String? createdAt) {
    if (createdAt == null) return "Unknown time";

    DateTime createdTime = DateTime.parse(createdAt);
    Duration difference = DateTime.now().difference(createdTime);

    if (difference.inDays >= 8) {
      return DateFormat('dd/MM/yyyy').format(createdTime);
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} hr${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} min${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "just now";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchArticles();
    });
  }

  Future<void> deleteArticle(String articleId, BuildContext context, int index) async {
    var box = Hive.box('userBox'); // Open Hive box
    List<dynamic> storedArticles = box.get('articles', defaultValue: []);

    storedArticles.removeWhere((article) => article['id'] == articleId);
    await box.put('articles', storedArticles);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Article deleted successfully")),
    );

    setState(() {
        articles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
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
                    style: TextStyle(fontSize: 14, color: Color.fromARGB(255,56, 106, 237)),
                  ),
                ),
              ],
            ),
            articles.isEmpty 
              ? const Center(child: Text("No saved articles"))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];

                  return Slidable(
                    key: ValueKey(article['id']),
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      extentRatio: 0.6,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => AddPage(article: article,),
                              )
                            );
                          },
                          icon: Icons.edit,
                          backgroundColor: const Color.fromARGB(255,56,106,237),
                          foregroundColor: Colors.white,
                          label: 'Edit',
                        ),
                        SlidableAction(
                          onPressed: (context) async {
                            bool confirmDelete = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm Delete"),
                                  content: const Text("Are you sure you want to delete this article?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false), // Cancel
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true); // Confirm Delete
                                        deleteArticle(article['id'].toString(), context, index);
                                      },
                                      child: const Text("Delete", style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (confirmDelete) {
                              await deleteArticle(article['id'].toString(), context, index);
                            }
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Articles(article: article),
                            ),
                          );
                        },
                      child: Card(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Row(
                          children: [
                            article['imagePath'] != null && File(article['imagePath']).existsSync() ?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(article['imagePath']),
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ) 
                            : const Icon(Icons.image_not_supported, size: 50),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article['category'] ?? "No Category",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255,56,106,237),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    article['title'] ?? "No Title",
                                    style: const TextStyle(
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
                                          Text(
                                            formatTimeAgo(article['createdAt']),
                                            style: const TextStyle(
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
                                              color: Color.fromARGB(255,56, 106, 237),
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
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}