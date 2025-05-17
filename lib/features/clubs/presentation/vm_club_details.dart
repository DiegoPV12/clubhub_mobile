// lib/features/clubs/presentation/vm_club_details.dart

import 'package:clubhub_mobile/features/clubs/domain/models/member_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/data/membership_repository.dart';
import 'package:clubhub_mobile/features/clubs/data/members_repository.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/core/user/current_user_provider.dart';

class ClubDetailState {
  final AsyncValue<ClubDto> club;
  final AsyncValue<List<MemberDto>> members;
  final bool isMember;
  final bool isOwner;

  ClubDetailState({
    required this.club,
    required this.members,
    required this.isMember,
    required this.isOwner,
  });

  ClubDetailState copyWith({
    AsyncValue<ClubDto>? club,
    AsyncValue<List<MemberDto>>? members,
    bool? isMember,
    bool? isOwner,
  }) => ClubDetailState(
    club: club ?? this.club,
    members: members ?? this.members,
    isMember: isMember ?? this.isMember,
    isOwner: isOwner ?? this.isOwner,
  );
}

class ClubDetailVM extends StateNotifier<ClubDetailState> {
  ClubDetailVM(
    this._clubId,
    this._clubsRepo,
    this._memRepo,
    this._membersRepo,
    this._currentUserId,
  ) : super(
        ClubDetailState(
          club: const AsyncLoading(),
          members: const AsyncLoading(),
          isMember: false,
          isOwner: false,
        ),
      ) {
    _load();
  }

  final int _clubId;
  final ClubsRepository _clubsRepo;
  final MembershipRepository _memRepo;
  final MembersRepository _membersRepo;
  final int _currentUserId;

  Future<void> _load() async {
    final clubFuture = _clubsRepo.fetchClubs().then(
      (list) => list.firstWhere((c) => c.id == _clubId),
    );
    final membersFuture = _membersRepo.fetchMembers(_clubId);

    final results = await Future.wait([clubFuture, membersFuture]);
    final club = results[0] as ClubDto;
    final members = results[1] as List<MemberDto>;
    final isMember = members.any((m) => m.userId == _currentUserId);
    final isOwner = club.ownerId == _currentUserId;

    state = state.copyWith(
      club: AsyncData(club),
      members: AsyncData(members),
      isMember: isMember,
      isOwner: isOwner,
    );
  }

  Future<void> join() async {
    final ok = await _memRepo.join(_clubId);
    if (ok) _load();
  }

  Future<void> leave() async {
    final ok = await _memRepo.leave(_clubId);
    if (ok) _load();
  }

  /// ← NUEVO: Borra este club de la API
  Future<void> deleteClub() async {
    await _clubsRepo.delete(_clubId);
  }
}

/// Provider
final clubDetailVmProvider = StateNotifierProvider.family
    .autoDispose<ClubDetailVM, ClubDetailState, int>((ref, clubId) {
      final userId = ref
          .watch(currentUserProvider)
          .when(data: (u) => u.id, loading: () => 0, error: (_, __) => 0);
      return ClubDetailVM(
        clubId,
        ref.watch(clubsRepoProvider),
        ref.watch(membershipRepoProvider),
        ref.watch(membersRepoProvider),
        userId,
      );
    });
