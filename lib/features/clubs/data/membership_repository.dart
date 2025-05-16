import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';

abstract interface class MembershipRepository {
  Future<bool> join(int clubId);
  Future<bool> leave(int clubId);
}

class MembershipRepositoryImpl implements MembershipRepository {
  MembershipRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<bool> join(int clubId) async {
    final res = await _dio.post('/clubs/$clubId/join');
    // 204 No Content → true, 409 Conflict (ya miembro) también es éxito lógico
    return res.statusCode == 204 || res.statusCode == 409;
  }

  @override
  Future<bool> leave(int clubId) async {
    final res = await _dio.delete('/clubs/$clubId/leave');
    return res.statusCode == 204;
  }
}

final membershipRepoProvider = Provider<MembershipRepository>(
  (ref) => MembershipRepositoryImpl(ref.watch(dioProvider)),
);
