// lib/features/clubs/presentation/club_detail_vm.dart
import 'package:clubhub_mobile/core/user/current_user_provider.dart';
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/data/members_repository.dart';
import 'package:clubhub_mobile/features/clubs/data/membership_repository.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/member_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// …clase ClubDetailState…
class ClubDetailState {
  final AsyncValue<ClubDto> club;
  final AsyncValue<List<MemberDto>> members;
  final bool isMember;

  ClubDetailState({
    required this.club,
    required this.members,
    required this.isMember,
  });

  ClubDetailState copyWith({
    AsyncValue<ClubDto>? club,
    AsyncValue<List<MemberDto>>? members,
    bool? isMember,
  }) => ClubDetailState(
    club: club ?? this.club,
    members: members ?? this.members,
    isMember: isMember ?? this.isMember,
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
    // Club
    final clubFuture = _clubsRepo.fetchClubs().then(
      (list) => list.firstWhere((c) => c.id == _clubId),
    );
    // Members
    final membersFuture = _membersRepo.fetchMembers(_clubId);

    final results = await Future.wait([clubFuture, membersFuture]);
    final club = results[0] as ClubDto;
    final members = results[1] as List<MemberDto>;
    final isMember = members.any((m) => m.userId == _currentUserId);

    state = state.copyWith(
      club: AsyncData(club),
      members: AsyncData(members),
      isMember: isMember,
    );
  }

  // join() y leave() sin cambios excepto refrescar miembros
  Future<void> join() async {
    final ok = await _memRepo.join(_clubId);
    if (ok) {
      _load(); // recarga miembros y club
    }
  }

  Future<void> leave() async {
    final ok = await _memRepo.leave(_clubId);
    if (ok) {
      _load();
    }
  }
}

final clubDetailVmProvider = StateNotifierProvider.family
    .autoDispose<ClubDetailVM, ClubDetailState, int>((ref, clubId) {
      final userId = ref
          .watch(currentUserProvider)
          .maybeWhen(data: (id) => id, orElse: () => 0);
      return ClubDetailVM(
        clubId,
        ref.watch(clubsRepoProvider),
        ref.watch(membershipRepoProvider),
        ref.watch(membersRepoProvider),
        userId,
      );
    });
