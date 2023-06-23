import 'package:flutter/material.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/utils/box_size.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSize.screenHeight,
      width: BoxSize.screenWidth,
      color: AppColors.blueLight,
    );
  }
}
