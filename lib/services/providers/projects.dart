import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/database/database.dart' as db;
import 'package:nahpu/services/database/project_queries.dart';

final projectListProvider = FutureProvider.autoDispose<List<ListProjectResult>>(
    (ref) => ProjectQuery(ref.read(databaseProvider)).getProjectList());

final projectInfoProvider = FutureProvider.autoDispose
    .family<db.ProjectData?, String>((ref, uuid) =>
        ProjectQuery(ref.read(databaseProvider)).getProjectByUuid(uuid));

class ProjectUuid extends Notifier<String> {
  @override
  String build() => '';

  void updateProjectUuid(String uuid) => state = uuid;
}

final projectUuidProvider =
    NotifierProvider<ProjectUuid, String>(ProjectUuid.new);

class ProjectNavbarIndex extends Notifier<int> {
  @override
  int build() => 0;

  void update(int index) => state = index;
}

final projectNavbarIndexProvider =
    NotifierProvider<ProjectNavbarIndex, int>(ProjectNavbarIndex.new);
