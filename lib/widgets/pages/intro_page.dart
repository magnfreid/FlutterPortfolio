import 'package:flutter/material.dart';
import 'package:portfolio/widgets/pages/scroll_container.dart';

import '../../page_texts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool mobile = MediaQuery.of(context).size.width < 600;
    return ScrollContainer(
      mobileLayout: mobile,
      child: Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage("assets/profile_picture.jpeg"),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          Text(PageTexts.introduction),
        ],
      ),
    );
  }
}
