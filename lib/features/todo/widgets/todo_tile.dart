import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      tileColor: AppColors.greyLight,
      contentPadding: EdgeInsets.symmetric(
        vertical: BoxSize.padding10FW,
      ).copyWith(
        right: BoxSize.padding16FW,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BoxSize.radius12),
      ),
      dense: false,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.maximumDensity,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Today\'stask',
            style: FontStyles.poppinsBold(color: Colors.white, size: 18),
          ),
          Text(
            'Subtitle',
            style: FontStyles.poppinsMedium(
              color: Colors.white,
              size: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: BoxSize.padding5FW),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.bkDark,
                borderRadius: BorderRadius.circular(BoxSize.radius9),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 9.w,
                vertical: BoxSize.padding5FH,
              ),
              child: Text(
                '03.00 / 08.00',
                style: FontStyles.poppinsRegular(
                  color: Colors.grey.shade400,
                  size: 8,
                ),
              ),
            ),
          ],
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: BoxSize.padding16FW),
        height: double.infinity,
        width: 5,
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
      ),
    );
  }
}
