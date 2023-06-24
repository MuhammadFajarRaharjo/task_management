import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/features/onboarding/pages/page_one.dart';
import 'package:task_management/features/onboarding/widgets/page_indicator.dart';

import '../../../common/widgets/width.spacer.dart';
import 'page_two.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //* Contain
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),

          //* Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Next Button
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: Icon(
                                Icons.navigate_next,
                                color: AppColors.bkDark,
                              ),
                            ),
                            WidthSpacer.from5(),
                            Text(
                              'Next',
                              style: FontStyles.poppinsMedium(
                                  size: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //* Indicator
                  PageIndicator(
                    controller: pageController,
                    numPages: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
