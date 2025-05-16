import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

enum RsvpStatus { Going, Maybe, Declined }

abstract interface class RsvpRepository {
  Future<void> send(int eventId, RsvpStatus status);
}

class RsvpRepoImpl implements RsvpRepository {
  RsvpRepoImpl(this._dio);
  final Dio _dio;

  @override
  Future<void> send(int eventId, RsvpStatus status) async {
    await _dio.post('/events/$eventId/rsvp/${status.name}');
  }
}

final rsvpRepoProvider = Provider<RsvpRepository>(
  (ref) => RsvpRepoImpl(ref.watch(dioProvider)),
);
