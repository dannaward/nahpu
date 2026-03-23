import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/providers/projects.dart';
import 'package:nahpu/services/database/collevent_queries.dart';
import 'package:nahpu/services/database/database.dart';
import 'package:nahpu/services/database/media_queries.dart';
import 'package:nahpu/services/database/site_queries.dart';
import 'package:nahpu/services/database/coordinate_queries.dart';
import 'package:nahpu/services/site_services.dart';

final siteEntryProvider = AsyncNotifierProvider<SiteEntry, List<SiteData>>(
  SiteEntry.new,
);

class SiteEntry extends AsyncNotifier<List<SiteData>> {
  Future<List<SiteData>> _fetchSiteEntry() async {
    final projectUuid = ref.watch(projectUuidProvider);
    return SiteQuery(ref.read(databaseProvider)).getAllSites(projectUuid);
  }

  @override
  FutureOr<List<SiteData>> build() async {
    return await _fetchSiteEntry();
  }

  Future<void> search(String? query) async {
    if (query == null || query.isEmpty) return;
    final current = await future;
    if (current.isEmpty) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final sites = await _fetchSiteEntry();
      return SiteSearchServices(siteEntries: sites).search(query.toLowerCase());
    });
  }
}

final coordinateBySiteProvider = FutureProvider.autoDispose
    .family<List<CoordinateData>, int>((ref, siteId) =>
        CoordinateQuery(ref.read(databaseProvider))
            .getCoordinatesBySiteID(siteId));

final coordinateByEventProvider = FutureProvider.autoDispose
    .family<List<CoordinateData>, int>((ref, collEventId) async {
  final collEvent = await CollEventQuery(ref.read(databaseProvider))
      .getCollEventById(collEventId);
  if (collEvent.siteID != null) {
    return CoordinateQuery(ref.read(databaseProvider))
        .getCoordinatesBySiteID(collEvent.siteID!);
  }
  return [];
});

final siteMediaProvider = FutureProvider.autoDispose
    .family<List<MediaData>, int>((ref, siteId) async {
  final List<SiteMediaData> mediaList =
      await SiteQuery(ref.read(databaseProvider)).getSiteMedia(siteId);
  final List<MediaData> mediaDataList = [];
  for (final SiteMediaData media in mediaList) {
    if (media.mediaId != null) {
      mediaDataList.add(
        await MediaDbQuery(ref.read(databaseProvider)).getMedia(media.mediaId!),
      );
    }
  }
  return mediaDataList;
});

final siteInEventProvider =
    FutureProvider.autoDispose<List<SiteData>>((ref) async {
  final List<int?> siteList = await CollEventQuery(ref.read(databaseProvider))
      .getAllDistinctSites(ref.read(projectUuidProvider));
  final List<SiteData> siteDataList = [];
  for (final int? siteId in siteList) {
    if (siteId != null) {
      siteDataList.add(
        await SiteQuery(ref.read(databaseProvider)).getSiteById(siteId),
      );
    }
  }
  return siteDataList;
});
