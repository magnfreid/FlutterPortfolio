import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ui/widgets/scroll_container.dart';
import '../../data/app-data/sizes.dart';
import 'package:web/web.dart' as web;

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileSize =
        MediaQuery.of(context).size.width < mobileWidthThreshold;
    return ScrollContainer(
      mobileLayout: isMobileSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 50,
        children: [
          _contactItem("assets/icon_linkedin_full.png", () {
            web.window.open(
              "https://www.linkedin.com/in/magnus-freidenfelt-bb914629b/",
              "_blank",
            );
          }),
          _contactItem("assets/icon_github.png", () {
            web.window.open("https://github.com/magnfreid", "_blank");
          }),
          // _contactItem("assets/icon_email.png", () {
          //   web.window.open("mailto:sabbathmagnus@gmail.com", "_self");
          // }),
          _contactItem("assets/icon_discord.png", () {
            web.window.open(
              "https://discord.com/users/230693703382073354",
              "_blank",
            );
          }),
          SizedBox(
            width: 200,
            height: 120,
            child: TextButton(
              onPressed: () {
                web.window.open("mailto:sabbathmagnus@gmail.com", "_self");
              },
              child: Text(
                "EMAIL",
                style: GoogleFonts.spaceMono(fontSize: 48, letterSpacing: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

InkWell _contactItem(String imgPath, VoidCallback onClick) {
  return InkWell(
    onTap: onClick,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imgPath,
        width: 200,
        height: 120,
        fit: BoxFit.scaleDown,
      ),
    ),
  );
}
