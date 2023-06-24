import 'package:country_picker/country_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countryProvider = StateProvider<Country>((ref) {
  return Country(
      phoneCode: '62',
      countryCode: 'ID',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Indonesia',
      example: 'Indonesia',
      displayName: 'Indonesia',
      displayNameNoCountryCode: 'ID',
      e164Key: '');
});
