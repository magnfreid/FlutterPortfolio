import 'package:flutter/material.dart';
import '../../data/app-data/app_texts.dart';
import '../../data/app-data/sizes.dart';
import '../widgets/scroll_container.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobileSize =
        MediaQuery.of(context).size.width < mobileWidthThreshold;
    return ScrollContainer(
      mobileLayout: isMobileSize,
      child: Column(
        spacing: 20,
        children: [
          CircleAvatar(
            radius: isMobileSize ? 90 : 150,
            backgroundImage: AssetImage("assets/profile_picture.jpeg"),
            backgroundColor: Colors.grey.shade200,
          ),
          Text(
            introductionText,
            style: TextStyle(fontSize: isMobileSize ? 14 : 18),
          ),
        ],
      ),
    );
  }
}
