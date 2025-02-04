import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:blog_club/constants/on_boarding_data.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  // final onBoarding1 = data[0];
  // final onBoarding2 = data[1];
  // final onBoarding3 = data[2];

  // final currentOnBoarding = 0;
  
  @override
  State<OnBoarding> createState() {
    return _OnBoardingState();
  }
}

class _OnBoardingState extends State<OnBoarding> {
  _OnBoardingState();

  final PageController _pageController = PageController();
  int currentOnBoarding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentOnBoarding = index;
                });
              },
              itemCount: data.length,
              itemBuilder: (context, index) {
                return OnBoardingWidget(
                  title: data[index].title,
                  description: data[index].description,
                  image: data[index].image,
                  length: data.length,
                  currentIndex: currentOnBoarding,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.length,
    required this.currentIndex,
  });

  final String image;
  final String title;
  final String description;
  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(image),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color: Colors.white,
        ),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: length,
                      effect: ExpandingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: const Color.fromARGB(255,56, 106, 237),
                        dotColor: const Color.fromARGB(255, 56, 106, 237).withOpacity(0.5),
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        backgroundColor: const Color.fromARGB(255,56, 106, 237),
                      ),
                      icon: const Icon(Icons.arrow_forward_outlined, size: 30.0,), 
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
    );
  }
}