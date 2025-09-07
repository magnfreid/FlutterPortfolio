import 'package:flutter/material.dart';
import 'package:portfolio/widgets/pages/scroll_container.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({super.key});

  final List<Map<String, dynamic>> _skills = [
    {
      "title": "Flutter",
      "descriptions": [
        "State management and dependency injection with Riverpod",
        "Responsive design for web and mobile",
        "Material Design and Cupertino widgets",
      ],
      "imgPath": "assets/icon_flutter.png",
    },
    {
      "title": "React Native",
      "descriptions": [
        "Navigation with React Navigation",
        "Redux state management (actions, reducers, middleware)",
      ],
      "imgPath": "assets/icon_react.png",
    },
    {
      "title": "Android",
      "descriptions": [
        "XML layouts (ConstraintLayout, RecyclerView, custom views)",
        "Jetpack Compose (state hoisting, slot APIs, previews, theming, material components)",
        "Dependency Injection (Hilt / Dagger)",
        "Room for local persistence",
        "WorkManager for background tasks",
      ],
      "imgPath": "assets/icon_android.png",
    },
    {
      "title": "iOS",
      "descriptions": [
        "UIKit (programmatic views, Auto Layout, collection/table views)",
        "SwiftUI (state management with @State, @ObservedObject, @EnvironmentObject)",
        "MVVM & Combine for reactive flows",
        "SwiftData",
      ],
      "imgPath": "assets/icon_ios.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 600;
    return ScrollContainer(
      mobileLayout: mobile,
      child: mobile
          ? FractionallySizedBox(
              widthFactor: 0.7,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      "Frameworks & libraries",
                      style: TextStyle(
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 100,
                      children: _skills
                          .map(
                            (skill) => SkillItem(
                              title: skill["title"],
                              descriptions: skill["descriptions"],
                              imgPath: skill["imgPath"],
                              size: 120,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
          : Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: _skills
                    .map(
                      (skill) => SkillItem(
                        title: skill["title"],
                        descriptions: skill["descriptions"],
                        imgPath: skill["imgPath"],
                        size: 40,
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String title;
  final List<String> descriptions;
  final String imgPath;
  final double size;

  const SkillItem({
    super.key,
    required this.title,
    required this.descriptions,
    required this.imgPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Image.asset(imgPath, width: size, height: size, fit: BoxFit.scaleDown),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: descriptions
                .map(
                  (description) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("· "),
                      Expanded(child: Text(description)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
