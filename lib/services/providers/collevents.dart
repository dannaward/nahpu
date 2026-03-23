import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nahpu/services/providers/database.dart';
import 'package:nahpu/services/collevent_services.dart';
import 'package:nahpu/services/database/collevent_queries.dart';
import 'package:nahpu/services/database/database.dart';
import 'package:nahpu/services/providers/projects.dart';

final collEventEntryProvider =
    AsyncNotifierProvider<CollEventEntry, List<CollEventData>>(
  CollEventEntry.new,
);

class CollEventEntry extends AsyncNotifier<List<CollEventData>> {
  Future<List<CollEventData>> _fetchCollEventEntry() async {
    final projectUuid = ref.watch(projectUuidProvider);
    return CollEventQuery(ref.read(databaseProvider))
        .getAllCollEvents(projectUuid);
  }

  @override
  FutureOr<List<CollEventData>> build() async {
    return await _fetchCollEventEntry();
  }

  Future<void> search(String? query) async {
    if (query == null || query.isEmpty) return;
    final current = await future;
    if (current.isEmpty) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final collEvents = await _fetchCollEventEntry();
      return CollEventSearchServices(collEvents: collEvents)
          .search(query.toLowerCase());
    });
  }
}

final collEventIDProvider = FutureProvider.autoDispose
    .family<CollEventData, int>((ref, id) =>
        CollEventQuery(ref.read(databaseProvider)).getCollEventById(id));

final collEffortByEventProvider = FutureProvider.autoDispose
    .family<List<CollEffortData>, int>((ref, collEventId) =>
        CollEffortQuery(ref.read(databaseProvider))
            .getCollEffortByEventId(collEventId));

final collPersonnelProvider = FutureProvider.autoDispose
    .family<List<CollPersonnelData>, int>((ref, collEventId) =>
        CollPersonnelQuery(ref.read(databaseProvider))
            .getCollPersonnelByEventId(collEventId));

final weatherDataProvider = FutureProvider.autoDispose.family<WeatherData, int>(
    (ref, collEventId) => WeatherDataQuery(ref.read(databaseProvider))
        .getWeatherDataByEventId(collEventId));
