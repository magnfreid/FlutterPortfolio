import 'package:flutter/material.dart';
import 'package:portfolio/data/constants/sizes.dart';
import '../../data/constants/app_texts.dart';
import '../widgets/scroll_container.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobileSize = MediaQuery.of(context).size.width < widthThreshold;
    return ScrollContainer(
      mobileLayout: isMobileSize,
      child: Column(
        spacing: 20,
        children: [
          CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage("assets/profile_picture.jpeg"),
            backgroundColor: Colors.grey.shade200,
          ),
          Text(introductionText),
        ],
      ),
    );
  }
}
