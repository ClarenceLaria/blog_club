
class OnBoardingItem {
  final String title;
  final String description;
  final String image;

  OnBoardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}


  var data = [
    OnBoardingItem(
      title: 'Welcome to the App',
      description: 'Discover a world of curated content tailored to your interests',
      image: 'assets/images/on_boarding_images/reading.webp',
    ),
    OnBoardingItem(
      title: 'Personalize Your Feed',
      description: 'Select your favorite topics to get a customized reading experience.',
      image: 'assets/images/on_boarding_images/turtle.webp',
    ),
    OnBoardingItem(
      title: 'Engage with the Community',
      description: 'Join discussions, leave comments, and connect with fellow readers.',
      image: 'assets/images/on_boarding_images/community.webp',
    ),
  ];
      // 'image': 'assets/images/on_boarding_images/meditation.jpg',
      // 'image2': 'assets/images/on_boarding_images/technology_vr.jpg',
      // 'image3': 'assets/images/on_boarding_images/turtle.jpg',
      // 'image4': 'assets/images/on_boarding_images/weather.jpg',