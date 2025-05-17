// lib/features/clubs/presentation/club_form_vm.dart
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_form_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class ClubFormState {
  const ClubFormState();
}

class ClubIdle extends ClubFormState {}

class ClubLoading extends ClubFormState {}

class ClubSuccess extends ClubFormState {
  final ClubDto club;
  const ClubSuccess(this.club);
}

class ClubError extends ClubFormState {
  final String msg;
  const ClubError(this.msg);
}

class ClubFormVM extends StateNotifier<ClubFormState> {
  ClubFormVM(this._repo) : super(ClubIdle());
  final ClubsRepository _repo;

  Future<void> submit({int? id, required ClubFormDto dto}) async {
    state = ClubLoading();
    try {
      final c =
          id == null ? await _repo.create(dto) : await _repo.update(id, dto);
      state = ClubSuccess(c);
    } catch (e) {
      state = ClubError(e.toString());
    }
  }
}

final clubFormVmProvider =
    StateNotifierProvider.autoDispose<ClubFormVM, ClubFormState>((ref) {
      return ClubFormVM(ref.watch(clubsRepoProvider));
    });
