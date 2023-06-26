import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/constants/box_size.dart';
import 'package:task_management/common/styles/app_colors.dart';
import 'package:task_management/common/styles/font_styles.dart';
import 'package:task_management/common/widgets/width.spacer.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeStart,
    required this.timeEnd,
    required this.onDelete,
    required this.switchValue,
    required this.onSwitchChanged,
  });
  final String title, subtitle, timeStart, timeEnd;
  final VoidCallback onDelete;
  final bool switchValue;
  final void Function(bool value) onSwitchChanged;

  @override
  Widget build(BuildContext context, ref) {
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
            title,
            style: FontStyles.poppinsBold(color: Colors.white, size: 18),
          ),
          Text(
            subtitle,
            style: FontStyles.poppinsMedium(
              color: Colors.white,
              size: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Row(
        children: [
          //* BADGE TIME
          Container(
            decoration: BoxDecoration(
              color: AppColors.bkDark,
              borderRadius: BorderRadius.circular(BoxSize.radius9),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: BoxSize.padding12FW,
              vertical: BoxSize.padding5FH,
            ),
            child: Text(
              '$timeStart / $timeEnd',
              style: FontStyles.poppinsRegular(
                color: Colors.white,
                size: 8,
              ),
            ),
          ),

          //* ICON DELETE
          WidthSpacer.from10(),
          IconButton(
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              iconSize: 16,
            ),
            onPressed: onDelete,
            icon: const Icon(
              FontAwesomeIcons.solidTrashCan,
              color: AppColors.bkDark,
            ),
          ),
        ],
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
      trailing: SizedBox(
        height: double.infinity,
        child: Switch(
          value: switchValue,
          onChanged: onSwitchChanged,
        ),
      ),
    );
  }
}
