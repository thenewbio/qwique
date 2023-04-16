class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/dummy_image1.jpg',
      title: 'Welcome to Aesthetic App',
      description: "A home to feel relax and surf movies"),
  Slide(
      imageUrl: 'assets/images/dummy_image2.jpg',
      title: 'It is going to be fun',
      description: "As you will view and any movie of your choice"),
  Slide(
      imageUrl: 'assets/images/dummy_image3.jpg',
      title: 'Once again welcome',
      description: "Every Video is at your fingertip in Aesthetic app "),
];
