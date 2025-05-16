// lib/features/clubs/data/clubs_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/club_dto.dart';
import '../../../core/network/dio_client.dart';

abstract interface class ClubsRepository {
  Future<List<ClubDto>> fetchClubs();
}

class ClubsRepositoryImpl implements ClubsRepository {
  ClubsRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<ClubDto>> fetchClubs() async {
    final res = await _dio.get('/clubs');
    final list =
        (res.data as List)
            .map((e) => ClubDto.fromJson(e as Map<String, dynamic>))
            .toList();
    return list;
  }
}

final clubsRepoProvider = Provider<ClubsRepository>(
  (ref) => ClubsRepositoryImpl(ref.watch(dioProvider)),
);
