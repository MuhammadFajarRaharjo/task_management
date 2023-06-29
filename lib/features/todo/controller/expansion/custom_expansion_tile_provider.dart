import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_expansion_tile_provider.g.dart';

///* Berisi state bool untuk memberikan state expansi atau tidak
@riverpod
class CustomExpantsionTileState extends _$CustomExpantsionTileState {
  @override
  bool build(Key key) {
    return false;
  }

  void toogle(bool value) {
    state = value;
  }
}
