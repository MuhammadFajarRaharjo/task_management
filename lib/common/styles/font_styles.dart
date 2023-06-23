import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  FontStyles._();
  static TextStyle poppinsMedium({double? size, Color? color}) =>
      GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: size?.sp,
        color: color,
      );
  static TextStyle poppinsRegular({double? size, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: size?.sp,
        color: color,
      );
  static TextStyle poppinsLight({double? size, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: size?.sp,
        color: color,
        fontWeight: FontWeight.w300,
      );
  static TextStyle poppinsSemiBold({double? size, Color? color}) =>
      GoogleFonts.poppins(
        fontSize: size?.sp,
        color: color,
        fontWeight: FontWeight.w600,
      );
  static poppinsBold({double? size, Color? color}) => GoogleFonts.poppins(
        fontSize: size?.sp,
        color: color,
        fontWeight: FontWeight.w700,
      );
}
