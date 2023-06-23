import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/constants/assets.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/widgets/height.spacer.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* Image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(Assets.todoImage),
          ),

          const HeightSpacer(size: 100),

          //* Desctription
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'ToDo With Riverpod',
              style: FontStyles.poppinsSemiBold(size: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const HeightSpacer(size: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Welcome!! do you want to create a task fast and with ease',
              style: FontStyles.poppinsRegular(
                size: 16,
                color: AppColors.greyLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
