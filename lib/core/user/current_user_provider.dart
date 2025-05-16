import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';

final currentUserProvider = FutureProvider<int>((ref) async {
  final dio = ref.watch(dioProvider);
  final res = await dio.get('/users/me');
  return res.data['id'] as int; // { id, name, email }
});
