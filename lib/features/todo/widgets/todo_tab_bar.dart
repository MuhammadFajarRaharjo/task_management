import 'package:flutter/material.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';

class TodoTabBar extends StatelessWidget {
  const TodoTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BoxSize.radius12),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
      child: TabBar(
        splashBorderRadius: BorderRadius.circular(BoxSize.radius12),
        controller: tabController,
        labelStyle: FontStyles.poppinsBold(
          size: 16,
          color: AppColors.bkDark,
        ),
        dividerColor: Colors.transparent,
        automaticIndicatorColorAdjustment: false,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(BoxSize.radius12),
          // border: Border.all(color: AppColors.bkDark),
          color: AppColors.greyLight,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        isScrollable: false,
        tabs: const [
          Tab(
            text: 'Pending',
          ),
          Tab(
            text: 'Complete',
          ),
        ],
      ),
    );
  }
}
