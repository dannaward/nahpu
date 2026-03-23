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
    r'c5868fad77bf661e6a072af4b88d775e4c9a40e1';

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
    r'6f88b4567febb79f75716be9a917c4a8c6aff78d';

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
