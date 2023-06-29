import 'package:country_picker/country_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_provider.g.dart';

///* Berisi State Class Country dari [country_picker]
///* Provider ini digunakan untuk memilih code telpon berdasarkan negara
///* pada page Login
@riverpod
class CountryState extends _$CountryState {
  @override
  build() => Country(
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

  void setCountry(Country country) {
    state = country;
  }
}
