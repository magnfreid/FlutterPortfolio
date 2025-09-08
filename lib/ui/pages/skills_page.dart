import 'package:flutter/material.dart';
import 'package:portfolio/data/constants/sizes.dart';
import '../../data/constants/skills-data.dart';
import '../../data/models/skill-model.dart';
import '../widgets/scroll_container.dart';
import '../widgets/skill-item.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileSize = MediaQuery.of(context).size.width < widthThreshold;
    return ScrollContainer(
      mobileLayout: isMobileSize,
      child: Column(
        spacing: 50,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _titleText("Frameworks & libraries"),
          ),
          _skillGrid(skills, mobileLayout: isMobileSize),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _titleText("Services"),
          ),
          _skillGrid(services, mobileLayout: isMobileSize),
        ],
      ),
    );
  }

  GridView _skillGrid(List<SkillModel> skills, {bool mobileLayout = false}) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: skills.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisExtent: 450,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        // childAspectRatio: mobileLayout ? 0.8 : 0.7,
      ),
      itemBuilder: (context, index) {
        final skill = skills[index];
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SkillItem(
                title: skill.title,
                descriptions: skill.descriptions,
                imgPath: skill.imgPath,
                size: 140,
              ),
            ),
          ],
        );
      },
    );
  }

  Text _titleText(String text) {
    return Text(
      text,
      style: TextStyle(
        letterSpacing: 4,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
