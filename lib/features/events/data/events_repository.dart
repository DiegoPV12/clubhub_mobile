import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

abstract interface class EventsRepository {
  Future<List<EventDto>> fetchForClub(int clubId);
}

class EventsRepoImpl implements EventsRepository {
  EventsRepoImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<EventDto>> fetchForClub(int clubId) async {
    final res = await _dio.get('/clubs/$clubId/events');
    return (res.data as List)
        .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final eventsRepoProvider = Provider<EventsRepository>(
  (ref) => EventsRepoImpl(ref.watch(dioProvider)),
);
