import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/data/constants/sizes.dart';
import 'package:portfolio/ui/pages/contact_page.dart';
import 'package:portfolio/ui/pages/intro_page.dart';
import 'package:portfolio/ui/pages/showcase_page.dart';
import 'package:portfolio/ui/pages/skills_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController();
  final List<Widget> _pages = [
    IntroPage(),
    SkillsPage(),
    ShowcasePage(),
    ContactPage(),
  ];
  int _currentPage = 0;

  void _goToPage(int page) {
    _controller.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = page;
    });
  }

  TextStyle underlineNavText(bool isUnderlined) {
    return isUnderlined
        ? TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          )
        : TextStyle();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool mobile = size.width < widthThreshold;
    return Scaffold(
      body: Column(
        children: [
          //MARK: HEADER
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Magnus' Portfolio",
                    style: GoogleFonts.abrilFatface(fontSize: 26),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navButton("Info", 0),
                    _navButton("Skills", 1),
                    _navButton("Showcase", 2),
                    _navButton("Contact", 3),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.05,
                  bottom: size.height * 0.05,
                  left: size.width * 0.15,
                  right: size.width * 0.15,
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (newPage) {
                      setState(() {
                        _currentPage = newPage;
                      });
                    },
                    children: _pages,
                  ),
                ),
                if (mobile)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: size.height * 0.02,
                    child: Center(
                      child: SmoothPageIndicator(
                        effect: WormEffect(),
                        controller: _controller,
                        count: _pages.length,
                      ),
                    ),
                  ),

                if (!mobile)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: size.width * 0.01,
                    child: IconButton(
                      iconSize: 60,
                      onPressed: (_currentPage == _pages.length - 1)
                          ? null
                          : () {
                              _goToPage(_currentPage + 1);
                            },
                      icon: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                if (!mobile)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: size.width * 0.01,
                    child: IconButton(
                      iconSize: 60,
                      onPressed: (_currentPage == 0)
                          ? null
                          : () {
                              _goToPage(_currentPage - 1);
                            },
                      icon: Icon(Icons.arrow_circle_left_outlined),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _navButton(String text, int page) {
    return TextButton(
      onPressed: () {
        _goToPage(page);
      },
      child: Text(
        text,
        style: page == _currentPage
            ? TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
              )
            : TextStyle(),
      ),
    );
  }
}
