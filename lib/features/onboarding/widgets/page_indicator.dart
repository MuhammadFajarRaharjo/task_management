import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final PageController controller;
  final int numPages;
  final Color selectedColor;
  final Color unselectedColor;

  const PageIndicator({
    super.key,
    required this.controller,
    required this.numPages,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
  });

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage = widget.controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(widget.numPages, (index) {
        double opacity = index == currentPage ? 1.0 : 0.5;
        return Opacity(
          opacity: opacity,
          child: Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentPage
                  ? widget.selectedColor
                  : widget.unselectedColor,
            ),
          ),
        );
      }),
    );
  }
}
