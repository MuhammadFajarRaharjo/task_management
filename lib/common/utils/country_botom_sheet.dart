import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../constants/box_size.dart';
import '../styles/app_colors.dart';
import '../styles/font_styles.dart';

void showCountryBottmSheet(
  BuildContext context, {
  required void Function(Country) onSelect,
}) {
  return showCountryPicker(
    countryListTheme: CountryListThemeData(
      searchTextStyle: FontStyles.poppinsSemiBold(
        size: 18,
        color: Colors.white,
      ),
      backgroundColor: AppColors.bkDark,
      inputDecoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BoxSize.radius12),
        ),
        hintText: 'Search country',
        hintStyle: FontStyles.poppinsSemiBold(
          size: 16,
          color: Colors.white54,
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 24,
          color: Colors.white,
        ),
      ),
      textStyle: FontStyles.poppinsRegular(
        size: 16,
        color: Colors.white,
      ),
      bottomSheetHeight: BoxSize.proportionalScreenHeight(80),
    ),
    context: context,
    onSelect: onSelect,
  );
}
