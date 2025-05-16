import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/member_dto.dart';
import '../../../core/network/dio_client.dart';

abstract interface class MembersRepository {
  Future<List<MemberDto>> fetchMembers(int clubId);
}

class MembersRepoImpl implements MembersRepository {
  MembersRepoImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<MemberDto>> fetchMembers(int clubId) async {
    final res = await _dio.get('/clubs/$clubId/members');
    return (res.data as List)
        .map((e) => MemberDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

final membersRepoProvider = Provider<MembersRepository>(
  (ref) => MembersRepoImpl(ref.watch(dioProvider)),
);
