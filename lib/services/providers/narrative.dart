import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/database/database.dart';
import 'package:nahpu/services/providers/projects.dart';
import 'package:nahpu/services/database/media_queries.dart';
import 'package:nahpu/services/database/narrative_queries.dart';
import 'package:nahpu/services/narrative_services.dart';

final narrativeEntryProvider =
    AsyncNotifierProvider<NarrativeEntry, List<NarrativeData>>(
  NarrativeEntry.new,
);

class NarrativeEntry extends AsyncNotifier<List<NarrativeData>> {
  Future<List<NarrativeData>> _fetchNarrativeEntry() async {
    final projectUuid = ref.watch(projectUuidProvider);
    return NarrativeQuery(ref.read(databaseProvider))
        .getAllNarrative(projectUuid);
  }

  @override
  FutureOr<List<NarrativeData>> build() async {
    return await _fetchNarrativeEntry();
  }

  Future<void> search(String? query) async {
    if (query == null || query.isEmpty) return;
    final current = await future;
    if (current.isEmpty) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final narratives = await _fetchNarrativeEntry();
      return NarrativeSearchServices(narrativeEntries: narratives)
          .search(query.toLowerCase());
    });
  }
}

final narrativeMediaProvider = FutureProvider.autoDispose
    .family<List<MediaData>, int>((ref, narrativeId) async {
  final List<NarrativeMediaData> mediaList =
      await NarrativeQuery(ref.read(databaseProvider))
          .getNarrativeMedia(narrativeId);
  final List<MediaData> mediaDataList = [];
  for (final NarrativeMediaData media in mediaList) {
    if (media.mediaId != null) {
      mediaDataList.add(
        await MediaDbQuery(ref.read(databaseProvider)).getMedia(media.mediaId!),
      );
    }
  }
  return mediaDataList;
});
