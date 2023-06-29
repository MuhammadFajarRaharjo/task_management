import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';

import '../controller/expansion/custom_expansion_tile_provider.dart';

class CustomExpansionTile extends ConsumerWidget {
  const CustomExpansionTile({
    required this.title,
    required this.subtitle,
    this.children = const <Widget>[],
    this.trailing,
    this.margin,
    super.key,
  });
  final String title, subtitle;
  final Widget? trailing;
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context, ref) {
    bool isExpand = ref.watch(customExpantsionTileStateProvider(key!));
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ExpansionTile(
        onExpansionChanged: (value) {
          ref
              .read(customExpantsionTileStateProvider(key!).notifier)
              .toogle(value);
        },
        collapsedBackgroundColor: AppColors.bkLight,
        backgroundColor: AppColors.bkLight,
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(BoxSize.radius12)),
        ),
        collapsedIconColor: AppColors.bkDark,
        iconColor: AppColors.bkDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(BoxSize.radius12)),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: BoxSize.padding16FW),
          height: double.infinity,
          width: 5,
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Text(
          title,
          style: FontStyles.poppinsBold(size: 22, color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: FontStyles.poppinsRegular(color: Colors.grey.shade400),
          overflow: TextOverflow.ellipsis,
        ),
        //* TITLE, SUBTITLE AND CUSTOM COLOR CUSTOM
        // title: Container(
        //   color: Colors.red,
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Container(
        //         height: 70.h,
        //         width: 5,
        //         decoration: BoxDecoration(
        //           color: Colors.red.shade100,
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //       ),
        //       WidthSpacer.from20(),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           Text(
        //             title,
        //             style: FontStyles.poppinsBold(size: 24, color: Colors.white),
        //           ),
        //           HeightSpacer.from10(),
        //           Text(
        //             subtitle,
        //             style: FontStyles.poppinsRegular(color: Colors.white),
        //             maxLines: 1,
        //             softWrap: false,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        tilePadding: EdgeInsets.symmetric(
          vertical: BoxSize.padding10FW,
        ).copyWith(
          right: BoxSize.padding16FW,
        ),
        trailing: trailing ??
            AnimatedRotation(
              turns: isExpand ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                FontAwesomeIcons.circleChevronUp,
                color: Colors.white,
              ),
            ),
        children: children,
      ),
    );
  }
}
