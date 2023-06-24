import 'package:flutter/material.dart';

import '../constants/box_size.dart';
import '../styles/app_colors.dart';
import '../styles/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  final Widget? prefixIcon, suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: FontStyles.poppinsBold(
        size: 18,
        color: AppColors.bkDark,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: BoxSize.padding16FH,
          horizontal: BoxSize.padding10FW,
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.bkDark,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: FontStyles.poppinsSemiBold(
          size: 16,
          color: AppColors.bkDark,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BoxSize.radius9),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greyDark),
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
      ),
    );
  }
}
