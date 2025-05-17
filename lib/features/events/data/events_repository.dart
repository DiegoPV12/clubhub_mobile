import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/event_form_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

abstract interface class EventsRepository {
  Future<List<EventDto>> fetchForClub(int clubId);
  Future<EventDto> create(int clubId, EventFormDto dto);
  Future<EventDto> update(int clubId, int eventId, EventFormDto dto);
  Future<void> delete(int clubId, int eventId);
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

  @override
  Future<EventDto> create(int clubId, EventFormDto dto) async {
    final res = await _dio.post('/clubs/$clubId/events', data: dto.toJson());
    return EventDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<EventDto> update(int clubId, int eventId, EventFormDto dto) async {
    final res = await _dio.put(
      '/clubs/$clubId/events/$eventId',
      data: dto.toJson(),
    );
    return EventDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<void> delete(int clubId, int eventId) =>
      _dio.delete('/clubs/$clubId/events/$eventId');
}

final eventsRepoProvider = Provider<EventsRepository>(
  (ref) => EventsRepoImpl(ref.watch(dioProvider)),
);
