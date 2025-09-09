import 'package:flutter/material.dart';

class ScrollContainer extends StatelessWidget {
  final bool mobileLayout;
  final Widget child;

  ///Handles different scroll behaviours for desktop and mobile. Use to wrap around main content/pages.
  const ScrollContainer({
    super.key,
    required this.mobileLayout,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: mobileLayout
          ? ScrollBehavior().copyWith(scrollbars: false)
          : ScrollBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mobileLayout ? 16 : 120,
            vertical: 16,
          ),
          child: child,
        ),
      ),
    );
  }
}
