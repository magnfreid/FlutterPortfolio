import 'package:flutter/material.dart';

class ScrollContainer extends StatelessWidget {
  final bool mobileLayout;
  final Widget child;

  const ScrollContainer({
    super.key,
    required this.mobileLayout,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScrollConfiguration(
        behavior: mobileLayout
            ? ScrollBehavior().copyWith(scrollbars: false)
            : ScrollBehavior(),
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
