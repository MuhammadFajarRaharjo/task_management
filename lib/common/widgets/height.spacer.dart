import 'package:flutter/material.dart';
import 'package:task_management/common/constants/box_size.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({super.key, required this.size});
  final double size;

  factory HeightSpacer.from100() => HeightSpacer(size: BoxSize.padding100FH);
  factory HeightSpacer.from30() => HeightSpacer(size: BoxSize.padding30FH);
  factory HeightSpacer.from20() => HeightSpacer(size: BoxSize.padding20FH);
  factory HeightSpacer.from10() => HeightSpacer(size: BoxSize.padding10FH);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
