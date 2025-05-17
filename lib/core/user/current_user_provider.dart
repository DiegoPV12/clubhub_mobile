// lib/core/user/current_user_provider.dart
import 'package:clubhub_mobile/features/clubs/domain/models/user_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';

final currentUserProvider = FutureProvider<UserDto>((ref) async {
  final dio = ref.watch(dioProvider);
  final res = await dio.get('/users/me');
  // El endpoint /users/me devuelve JSON con { id, name, email, createdAt }
  return UserDto.fromJson(res.data as Map<String, dynamic>);
});
