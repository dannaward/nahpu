import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/database/database.dart';
import 'package:nahpu/services/providers/projects.dart';
import 'package:nahpu/services/database/personnel_queries.dart';

final allPersonnelProvider = FutureProvider.autoDispose<List<PersonnelData>>(
    (ref) => PersonnelQuery(ref.read(databaseProvider)).getAllPersonnel());

final projectPersonnelProvider =
    FutureProvider.autoDispose<List<PersonnelData>>((ref) {
  final projectUuid = ref.watch(projectUuidProvider);
  return PersonnelQuery(ref.read(databaseProvider))
      .getPersonnelByProjectUuid(projectUuid);
});

final personnelNameProvider = FutureProvider.autoDispose
    .family<PersonnelData, String>((ref, uuid) =>
        PersonnelQuery(ref.read(databaseProvider)).getPersonnelByUuid(uuid));

final personnelInitialProvider = FutureProvider.autoDispose
    .family<String?, String>((ref, uuid) =>
        PersonnelQuery(ref.read(databaseProvider)).getInitial(uuid));
