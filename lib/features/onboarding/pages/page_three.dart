import 'package:flutter/material.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/utils/box_size.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSize.screenHeight,
      width: BoxSize.screenWidth,
      color: AppColors.green,
    );
  }
}
