// lib/features/events/data/attendees_repository.dart
import 'package:clubhub_mobile/features/clubs/domain/models/rsvp_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

abstract interface class AttendeesRepository {
  Future<List<RsvpDto>> fetch(int eventId);
}

class AttendeesRepoImpl implements AttendeesRepository {
  AttendeesRepoImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<RsvpDto>> fetch(int eventId) async {
    final res = await _dio.get('/events/$eventId/rsvps');
    return (res.data as List)
        .map((e) => RsvpDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final attendeesRepoProvider = Provider<AttendeesRepository>(
  (ref) => AttendeesRepoImpl(ref.watch(dioProvider)),
);
