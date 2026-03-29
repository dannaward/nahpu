// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectFormValidator)
final projectFormValidatorProvider = ProjectFormValidatorProvider._();

final class ProjectFormValidatorProvider
    extends $AsyncNotifierProvider<ProjectFormValidator, ProjectForm> {
  ProjectFormValidatorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectFormValidatorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectFormValidatorHash();

  @$internal
  @override
  ProjectFormValidator create() => ProjectFormValidator();
}

String _$projectFormValidatorHash() =>
    r'5f55c66383fb119b8252c80885e10542fd9de9fd';

abstract class _$ProjectFormValidator extends $AsyncNotifier<ProjectForm> {
  FutureOr<ProjectForm> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProjectForm>, ProjectForm>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ProjectForm>, ProjectForm>,
        AsyncValue<ProjectForm>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(PersonnelFormValidator)
final personnelFormValidatorProvider = PersonnelFormValidatorProvider._();

final class PersonnelFormValidatorProvider
    extends $AsyncNotifierProvider<PersonnelFormValidator, PersonnelForm> {
  PersonnelFormValidatorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'personnelFormValidatorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$personnelFormValidatorHash();

  @$internal
  @override
  PersonnelFormValidator create() => PersonnelFormValidator();
}

String _$personnelFormValidatorHash() =>
    r'827a75216ca9adfeb980533efe886f40a1d6b3f4';

abstract class _$PersonnelFormValidator extends $AsyncNotifier<PersonnelForm> {
  FutureOr<PersonnelForm> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<PersonnelForm>, PersonnelForm>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<PersonnelForm>, PersonnelForm>,
        AsyncValue<PersonnelForm>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
