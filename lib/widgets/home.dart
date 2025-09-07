import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/pages/contact_page.dart';
import 'package:portfolio/widgets/pages/projects_page.dart';
import 'package:portfolio/widgets/pages/intro_page.dart';
import 'package:portfolio/widgets/pages/skills_page.dart';
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
    ProjectsPage(),
    ContactPage(),
  ];
  int _currentPage = 0;

  void _goToPage(int page) {
    if (page >= 0 && page < _pages.length) {
      _controller.animateToPage(
        page,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = page;
      });
    }
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
    final bool mobile = MediaQuery.of(context).size.width < 600;
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
                    _navButton("Intro", 0),
                    _navButton("Skills", 1),
                    _navButton("Projects", 2),
                    _navButton("Contact", 3),
                  ],
                ),
              ],
            ),
          ),
          //MARK: MAIN
          Expanded(
            child: Center(
              child: mobile
                  ? Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: PageView(
                              controller: _controller,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: _pages,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: _pages.length,
                            effect: WormEffect(
                              dotColor: Theme.of(context).colorScheme.outline,
                              activeDotColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //MARK: LEFT BUTTON
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            iconSize: 60,
                            onPressed: _currentPage == 0
                                ? null
                                : () {
                                    _goToPage(_currentPage - 1);
                                  },
                            icon: Icon(Icons.arrow_circle_left_outlined),
                          ),
                        ),
                        //MARK: PAGE VIEW
                        Expanded(
                          flex: 4,
                          child: PageView(
                            controller: _controller,
                            children: _pages,
                          ),
                        ),
                        //MARK: RIGHT BUTTON
                        Expanded(
                          flex: 1,
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
                      ],
                    ),
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
