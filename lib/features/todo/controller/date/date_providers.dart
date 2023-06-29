import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_providers.g.dart';

/// Provider for set date in add page
@riverpod
class DateState extends _$DateState {
  @override
  String build() {
    return "";
  }

  void setDate(String date) => state = date;
  void clear() => state = '';
}

/// Provider for set start time in add page
@riverpod
class StartTimeState extends _$StartTimeState {
  @override
  String build() {
    return "";
  }

  void setTime(String date) => state = date;
  void clear() => state = '';
}

/// Provider for set end time in add page
@riverpod
class EndTimeState extends _$EndTimeState {
  @override
  String build() {
    return "";
  }

  void setTime(String date) => state = date;
  void clear() => state = '';
}
