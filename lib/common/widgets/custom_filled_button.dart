import 'package:flutter/material.dart';
import 'package:task_management/common/styles/app_colors.dart';

import '../constants/box_size.dart';
import '../styles/font_styles.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgorundColor,
    this.textColor,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width, height;
  final Color? backgorundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        backgroundColor: backgorundColor ?? Colors.white,
        minimumSize: Size(
          width ?? BoxSize.proportionalScreenWidth(90),
          height ?? BoxSize.proportionalScreenHeight(8),
        ),
      ),
      child: Text(
        text,
        style: FontStyles.poppinsBold(
          size: 18,
          color: textColor ?? AppColors.bkDark,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
