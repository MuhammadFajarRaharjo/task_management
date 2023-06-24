import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_management/common/constants/assets.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/routes/route_name.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/widgets/height.spacer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeightSpacer(size: BoxSize.proportionalScreenHeight(15)),
                Image.asset(
                  Assets.todoImage,
                  width: BoxSize.proportionalScreenWidth(60),
                ),
                HeightSpacer(size: 26.h),
                Text(
                  'Enter your OTP code',
                  style: FontStyles.poppinsBold(size: 18, color: Colors.white),
                ),
                HeightSpacer(size: 26.h),
                Pinput(
                  keyboardType: TextInputType.phone,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    height: BoxSize.proportionalScreenWidth(14),
                    width: BoxSize.proportionalScreenWidth(12),
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(BoxSize.radius12),
                    ),
                    textStyle: FontStyles.poppinsMedium(
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  onCompleted: (value) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteName.home,
                      (route) => false,
                    );
                  },
                  onSubmitted: (value) => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.home,
                    (route) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
