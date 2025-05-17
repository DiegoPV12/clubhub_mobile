// lib/features/clubs/presentation/vm_profile.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clubhub_mobile/core/user/current_user_provider.dart';
import 'package:clubhub_mobile/features/clubs/presentation/vm_clubs.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/features/clubs/data/members_repository.dart';

/// Clubes que administro: ownerId == currentUser.id
final ownedClubsProvider = Provider<List<ClubDto>>((ref) {
  final clubsAsync = ref.watch(clubsVmProvider);
  final userAsync = ref.watch(currentUserProvider);

  if (clubsAsync is AsyncData<List<ClubDto>> && userAsync is AsyncData) {
    final user = (userAsync as AsyncData).value;
    final allClubs = clubsAsync.value;
    return allClubs.where((c) => c.ownerId == user.id).toList();
  }

  // Mientras carga o falla, devuelve vacío
  return <ClubDto>[];
});

/// Clubes en los que participo (pero no administro)
final memberClubsProvider = FutureProvider.autoDispose<List<ClubDto>>((
  ref,
) async {
  final clubsAsync = ref.watch(clubsVmProvider);
  final userAsync = ref.watch(currentUserProvider);

  if (clubsAsync is AsyncData<List<ClubDto>> && userAsync is AsyncData) {
    final user = (userAsync as AsyncData).value;
    final allClubs = clubsAsync.value;
    final repo = ref.watch(membersRepoProvider);
    final result = <ClubDto>[];

    // Sólo itera sobre los que NO administro
    for (final club in allClubs.where((c) => c.ownerId != user.id)) {
      final members = await repo.fetchMembers(club.id);
      if (members.any((m) => m.userId == user.id)) {
        result.add(club);
      }
    }
    return result;
  }

  return <ClubDto>[];
});
