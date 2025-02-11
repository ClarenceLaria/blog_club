import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class UserStories extends StatefulWidget {
  const UserStories({super.key});

  @override
  _UserStoriesState createState() => _UserStoriesState();
}

class _UserStoriesState extends State<UserStories> {
  final StoryController controller = StoryController();

  final List<StoryItem> storyItems = [
    StoryItem.text(title: "Welcome to my story!", backgroundColor: Colors.blue),
    StoryItem.pageImage(
      url: "https://example.com/story1.jpg",
      controller: StoryController(),
    ),
    StoryItem.pageImage(
      url: "https://example.com/story2.jpg",
      controller: StoryController(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: storyItems,
        controller: controller,
        onComplete: () {
          Navigator.pop(context);
        },
        repeat: false,
      ),
    );
  }
}