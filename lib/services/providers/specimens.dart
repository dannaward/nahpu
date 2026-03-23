import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/providers/settings.dart';
import 'package:nahpu/services/database/database.dart';
import 'package:nahpu/services/providers/projects.dart';
import 'package:nahpu/services/database/media_queries.dart';
import 'package:nahpu/services/database/specimen_queries.dart';
import 'package:nahpu/services/types/specimens.dart';

const String catalogFmtPrefKey = 'catalogFmt';

class CatalogFmtNotifier extends AsyncNotifier<CatalogFmt> {
  Future<CatalogFmt> _fetchSetting() async {
    final prefs = ref.watch(settingProvider);
    final savedFmt = prefs.getString(catalogFmtPrefKey);
    final CatalogFmt currentFmt = matchTaxonGroupToCatFmt(savedFmt);
    if (savedFmt == null) {
      await prefs.setString(
          catalogFmtPrefKey, matchCatFmtToTaxonGroup(currentFmt));
    }
    return currentFmt;
  }

  @override
  FutureOr<CatalogFmt> build() async {
    return await _fetchSetting();
  }

  Future<void> set(CatalogFmt fmt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final prefs = ref.watch(settingProvider);
      final value = prefs.getString(catalogFmtPrefKey);
      final setFmt = matchTaxonGroupToCatFmt(value);
      if (setFmt == fmt) return fmt;
      await prefs.setString(catalogFmtPrefKey, matchCatFmtToTaxonGroup(fmt));
      return fmt;
    });
  }
}

final catalogFmtNotifierProvider =
    AsyncNotifierProvider<CatalogFmtNotifier, CatalogFmt>(
  CatalogFmtNotifier.new,
);

class SpecimenEntry extends AsyncNotifier<List<SpecimenData>> {
  Future<List<SpecimenData>> _fetchSpecimenEntry() async {
    final projectUuid = ref.watch(projectUuidProvider);
    return SpecimenQuery(ref.read(databaseProvider))
        .getAllSpecimens(projectUuid);
  }

  @override
  FutureOr<List<SpecimenData>> build() async {
    return await _fetchSpecimenEntry();
  }
}

final specimenEntryProvider =
    AsyncNotifierProvider<SpecimenEntry, List<SpecimenData>>(
  SpecimenEntry.new,
);

final partBySpecimenProvider = FutureProvider.autoDispose
    .family<List<SpecimenPartData>, String>((ref, specimenUuid) =>
        SpecimenPartQuery(ref.read(databaseProvider))
            .getSpecimenParts(specimenUuid));

final associatedDataProvider = FutureProvider.autoDispose
    .family<List<AssociatedDataData>, String>((ref, specimenUuid) =>
        AssociatedDataQuery(ref.read(databaseProvider))
            .getAllAssociatedData(specimenUuid));

final specimenMediaProvider = FutureProvider.autoDispose
    .family<List<MediaData>, String>((ref, specimenUuid) async {
  final List<SpecimenMediaData> mediaList =
      await SpecimenQuery(ref.read(databaseProvider))
          .getSpecimenMedia(specimenUuid);
  final List<MediaData> mediaDataList = [];
  for (final SpecimenMediaData media in mediaList) {
    if (media.mediaId != null) {
      mediaDataList.add(
        await MediaDbQuery(ref.read(databaseProvider)).getMedia(media.mediaId!),
      );
    }
  }
  return mediaDataList;
});
