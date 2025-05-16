// lib/features/clubs/presentation/vm_clubs.dart
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clubsVmProvider = FutureProvider.autoDispose<List<ClubDto>>((ref) async {
  final repo = ref.watch(clubsRepoProvider);
  return repo.fetchClubs();
});
