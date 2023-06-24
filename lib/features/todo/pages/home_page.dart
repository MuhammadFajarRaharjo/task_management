import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/widgets/custom_text_form_field.dart';
import 'package:task_management/common/widgets/height.spacer.dart';

import '../widgets/add_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: BoxSize.padding20FW),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style: FontStyles.poppinsBold(
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    AddButton(
                      onTap: () {},
                    ),
                  ],
                ),
                HeightSpacer.from20(),
                const CustomTextFormField(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: AppColors.greyLight),
                  suffixIcon: Icon(
                    FontAwesomeIcons.sliders,
                    color: AppColors.greyLight,
                    size: 20,
                  ),
                ),
                HeightSpacer(size: 15.h),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Todo Riverpod',
          style: FontStyles.poppinsBold(size: 26),
        ),
      ),
    );
  }
}
