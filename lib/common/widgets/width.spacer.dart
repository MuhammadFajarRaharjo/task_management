import 'package:flutter/material.dart';
import 'package:task_management/common/constants/box_size.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.size});
  final double size;

  factory WidthSpacer.from5() => WidthSpacer(size: BoxSize.padding5FW);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
