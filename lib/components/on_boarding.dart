import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:blog_club/constants/on_boarding_data.dart';
import 'package:blog_club/components/landing.dart';

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

  bool lastPage = false;

  void nextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentOnBoarding = index;
                lastPage = index == 2 ? true : false;
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
                nextPage: nextPage,
              );
            },
          ),
          Container(
            alignment: const Alignment(0,1),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: const Color.fromARGB(255,56, 106, 237),
                    dotColor: const Color.fromARGB(255, 56, 106, 237).withOpacity(0.5),
                  ),
                ),
                if (lastPage)
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const Landing()),
                      );
                    }, 
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      backgroundColor: const Color.fromARGB(255,56, 106, 237),
                    ),
                    child: const Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 16)),
                  )
                else
                  IconButton(
                    onPressed: nextPage,
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      backgroundColor: const Color.fromARGB(255,56, 106, 237),
                    ),
                    icon: const Icon(Icons.arrow_forward_outlined, size: 25.0,), 
                    color: Colors.white,
                  ),
              ],
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
    required this.nextPage,
  });

  final String image;
  final String title;
  final String description;
  final int length;
  final int currentIndex;
  final void Function() nextPage;

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
              
            ],
          ),
        ),
      ),
    ],
    );
  }
}