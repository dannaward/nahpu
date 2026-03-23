// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setting)
final settingProvider = SettingProvider._();

final class SettingProvider extends $FunctionalProvider<SharedPreferences,
    SharedPreferences, SharedPreferences> with $Provider<SharedPreferences> {
  SettingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return setting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$settingHash() => r'b4ffdf1319400e689586e0f3860362fbad56142e';

@ProviderFor(ThemeSetting)
final themeSettingProvider = ThemeSettingProvider._();

final class ThemeSettingProvider
    extends $AsyncNotifierProvider<ThemeSetting, ThemeMode> {
  ThemeSettingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'themeSettingProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$themeSettingHash();

  @$internal
  @override
  ThemeSetting create() => ThemeSetting();
}

String _$themeSettingHash() => r'6c0fd6288d1348a4a74fd96f16a8d7e40821e875';

abstract class _$ThemeSetting extends $AsyncNotifier<ThemeMode> {
  FutureOr<ThemeMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ThemeMode>, ThemeMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ThemeMode>, ThemeMode>,
        AsyncValue<ThemeMode>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UserDefinedField)
final userDefinedFieldProvider = UserDefinedFieldFamily._();

final class UserDefinedFieldProvider
    extends $AsyncNotifierProvider<UserDefinedField, List<String>> {
  UserDefinedFieldProvider._(
      {required UserDefinedFieldFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'userDefinedFieldProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userDefinedFieldHash();

  @override
  String toString() {
    return r'userDefinedFieldProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserDefinedField create() => UserDefinedField();

  @override
  bool operator ==(Object other) {
    return other is UserDefinedFieldProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userDefinedFieldHash() => r'a2abef79db47f21b2ae7b1ae32595d56e45ebb8a';

final class UserDefinedFieldFamily extends $Family
    with
        $ClassFamilyOverride<UserDefinedField, AsyncValue<List<String>>,
            List<String>, FutureOr<List<String>>, String> {
  UserDefinedFieldFamily._()
      : super(
          retry: null,
          name: r'userDefinedFieldProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UserDefinedFieldProvider call(
    String prefKey,
  ) =>
      UserDefinedFieldProvider._(argument: prefKey, from: this);

  @override
  String toString() => r'userDefinedFieldProvider';
}

abstract class _$UserDefinedField extends $AsyncNotifier<List<String>> {
  late final _$args = ref.$arg as String;
  String get prefKey => _$args;

  FutureOr<List<String>> build(
    String prefKey,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<String>>, List<String>>,
        AsyncValue<List<String>>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(TextCaseFmtNotifier)
final textCaseFmtProvider = TextCaseFmtNotifierFamily._();

final class TextCaseFmtNotifierProvider
    extends $AsyncNotifierProvider<TextCaseFmtNotifier, TextCaseFmt> {
  TextCaseFmtNotifierProvider._(
      {required TextCaseFmtNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'textCaseFmtProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textCaseFmtNotifierHash();

  @override
  String toString() {
    return r'textCaseFmtProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TextCaseFmtNotifier create() => TextCaseFmtNotifier();

  @override
  bool operator ==(Object other) {
    return other is TextCaseFmtNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$textCaseFmtNotifierHash() =>
    r'81bb739ee4cbc4ddbbf686b24778fbe0ee24562e';

final class TextCaseFmtNotifierFamily extends $Family
    with
        $ClassFamilyOverride<TextCaseFmtNotifier, AsyncValue<TextCaseFmt>,
            TextCaseFmt, FutureOr<TextCaseFmt>, String> {
  TextCaseFmtNotifierFamily._()
      : super(
          retry: null,
          name: r'textCaseFmtProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TextCaseFmtNotifierProvider call(
    String prefKey,
  ) =>
      TextCaseFmtNotifierProvider._(argument: prefKey, from: this);

  @override
  String toString() => r'textCaseFmtProvider';
}

abstract class _$TextCaseFmtNotifier extends $AsyncNotifier<TextCaseFmt> {
  late final _$args = ref.$arg as String;
  String get prefKey => _$args;

  FutureOr<TextCaseFmt> build(
    String prefKey,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TextCaseFmt>, TextCaseFmt>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<TextCaseFmt>, TextCaseFmt>,
        AsyncValue<TextCaseFmt>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
