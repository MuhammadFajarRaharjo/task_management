// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_expansion_tile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customExpantsionTileStateHash() =>
    r'a7eb84c1b271a606267c0805aee9d1c10831916a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CustomExpantsionTileState
    extends BuildlessAutoDisposeNotifier<bool> {
  late final Key key;

  bool build(
    Key key,
  );
}

///* Berisi state bool untuk memberikan state expansi atau tidak
///
/// Copied from [CustomExpantsionTileState].
@ProviderFor(CustomExpantsionTileState)
const customExpantsionTileStateProvider = CustomExpantsionTileStateFamily();

///* Berisi state bool untuk memberikan state expansi atau tidak
///
/// Copied from [CustomExpantsionTileState].
class CustomExpantsionTileStateFamily extends Family<bool> {
  ///* Berisi state bool untuk memberikan state expansi atau tidak
  ///
  /// Copied from [CustomExpantsionTileState].
  const CustomExpantsionTileStateFamily();

  ///* Berisi state bool untuk memberikan state expansi atau tidak
  ///
  /// Copied from [CustomExpantsionTileState].
  CustomExpantsionTileStateProvider call(
    Key key,
  ) {
    return CustomExpantsionTileStateProvider(
      key,
    );
  }

  @override
  CustomExpantsionTileStateProvider getProviderOverride(
    covariant CustomExpantsionTileStateProvider provider,
  ) {
    return call(
      provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'customExpantsionTileStateProvider';
}

///* Berisi state bool untuk memberikan state expansi atau tidak
///
/// Copied from [CustomExpantsionTileState].
class CustomExpantsionTileStateProvider
    extends AutoDisposeNotifierProviderImpl<CustomExpantsionTileState, bool> {
  ///* Berisi state bool untuk memberikan state expansi atau tidak
  ///
  /// Copied from [CustomExpantsionTileState].
  CustomExpantsionTileStateProvider(
    this.key,
  ) : super.internal(
          () => CustomExpantsionTileState()..key = key,
          from: customExpantsionTileStateProvider,
          name: r'customExpantsionTileStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customExpantsionTileStateHash,
          dependencies: CustomExpantsionTileStateFamily._dependencies,
          allTransitiveDependencies:
              CustomExpantsionTileStateFamily._allTransitiveDependencies,
        );

  final Key key;

  @override
  bool operator ==(Object other) {
    return other is CustomExpantsionTileStateProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  bool runNotifierBuild(
    covariant CustomExpantsionTileState notifier,
  ) {
    return notifier.build(
      key,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
