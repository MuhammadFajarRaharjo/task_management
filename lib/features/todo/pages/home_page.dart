import 'package:flutter/material.dart';
import 'package:task_management/common/styles/font_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Todo Riverpod',
          style: FontStyles.poppinsBold(size: 26),
        ),
      ),
    );
  }
}
