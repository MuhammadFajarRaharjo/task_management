import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/constants/assets.dart';
import 'package:task_management/common/routes/route_name.dart';
import 'package:task_management/common/widgets/custom_outline_button.dart';
import 'package:task_management/common/widgets/height.spacer.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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

          HeightSpacer.from100(),

          //* Botton login
          CustomOutlineButton(
            text: 'Login with a phone number',
            onPressed: () => Navigator.pushNamed(context, RouteName.login),
          ),
        ],
      ),
    );
  }
}
