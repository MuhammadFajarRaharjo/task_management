import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.button,
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(BoxSize.radius7)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(BoxSize.radius7),
        child: SizedBox(
          height: 25.w,
          width: 25.w,
          child: const Icon(
            Icons.add,
            color: AppColors.bkDark,
            size: 20,
          ),
        ),
      ),
    );
  }
}
