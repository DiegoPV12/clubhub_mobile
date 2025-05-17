// lib/features/clubs/data/clubs_repository.dart
import 'package:clubhub_mobile/features/clubs/domain/models/club_form_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/club_dto.dart';
import '../../../core/network/dio_client.dart';

abstract interface class ClubsRepository {
  Future<List<ClubDto>> fetchClubs();
  Future<ClubDto> create(ClubFormDto dto); // ← nuevo
  Future<ClubDto> update(int id, ClubFormDto dto); // ←
  Future<void> delete(int id);
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

  @override
  Future<ClubDto> create(ClubFormDto dto) async {
    final res = await _dio.post('/clubs', data: dto.toJson());
    return ClubDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<ClubDto> update(int id, ClubFormDto dto) async {
    final res = await _dio.put('/clubs/$id', data: dto.toJson());
    return ClubDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<void> delete(int id) => _dio.delete('/clubs/$id');
}

final clubsRepoProvider = Provider<ClubsRepository>(
  (ref) => ClubsRepositoryImpl(ref.watch(dioProvider)),
);
