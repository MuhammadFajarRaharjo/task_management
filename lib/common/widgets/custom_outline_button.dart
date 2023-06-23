import 'package:flutter/material.dart';

import '../constants/box_size.dart';
import '../styles/font_styles.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.width,
    this.height,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width, height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(color: color ?? Colors.white),
        minimumSize: Size(
          width ?? BoxSize.screenWidth * 0.9,
          height ?? BoxSize.screenHeight * 0.07,
        ),
      ),
      child: Text(
        text,
        style: FontStyles.poppinsBold(size: 18, color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
