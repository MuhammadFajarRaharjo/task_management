import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxSize {
  BoxSize._();
  static final screenWidth = 375.w;
  static final screenHeight = 825.h;

  ///*  memberikan padding 100 dari width layar
  static final padding100FW = 100.w;

  ///*  memberikan padding 100 dari height layar
  static final padding100FH = 100.h;

  ///*  memberikan padding 30 dari width layar
  static final padding30FW = 30.w;

  ///*  memberikan padding 30 dari height layar
  static final padding30FH = 30.h;

  ///*  memberikan padding 20 dari width layar
  static final padding20FW = 20.w;

  ///*  memberikan padding 20 dari height layar
  static final padding20FH = 20.h;

  ///*  memberikan padding 16 dari width layar
  static final padding16FW = 16.w;

  ///*  memberikan padding 16 dari height layar
  static final padding16FH = 16.h;

  ///*  memberikan padding 12 dari width layar
  static final padding12FW = 12.w;

  ///*  memberikan padding 12 dari height layar
  static final padding12FH = 12.h;

  ///*  memberikan padding 10 dari width layar
  static final padding10FW = 10.w;

  ///*  memberikan padding 10 dari height layar
  static final padding10FH = 10.h;

  ///*  memberikan padding 5 dari width layar
  static final padding5FW = 5.w;

  ///*  memberikan padding 5 dari height layar
  static final padding5FH = 5.h;

  ///* Memberikan radius 12
  static const radius12 = 12.0;

  ///* Memberikan radius 9
  static const radius9 = 9.0;

  ///* Memberikan radius 7
  static const radius7 = 7.0;

  ///* memberikan persentase dari ukuran lebar layar
  static double proportionalScreenWidth(double percent) =>
      (screenWidth * (percent / 100)).w;

  ///* memberikan persentase dari ukuran tinggi layar
  static double proportionalScreenHeight(double percent) =>
      (screenHeight * (percent / 100)).h;
}
