import 'package:flutter/material.dart';

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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
