// lib/features/clubs/presentation/vm_clubs.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clubhub_mobile/features/clubs/data/clubs_repository.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/club_dto.dart';

/// Un StateNotifier que carga la lista de clubes y permite eliminarlos.
class ClubsNotifier extends StateNotifier<AsyncValue<List<ClubDto>>> {
  final ClubsRepository _repo;

  ClubsNotifier(this._repo) : super(const AsyncLoading()) {
    _loadClubs();
  }

  /// Carga todos los clubes.
  Future<void> _loadClubs() async {
    try {
      final clubs = await _repo.fetchClubs();
      state = AsyncData(clubs);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Elimina el club con [id] y vuelve a recargar la lista.
  Future<void> deleteClub(int id) async {
    // Podrías manejar errores aquí si lo deseas.
    await _repo.delete(id);
    await _loadClubs();
  }

  /// Forzar recarga manual (si la necesitas en algún caso).
  Future<void> refresh() => _loadClubs();
}

/// Provider para exponer el estado y el notifier.
final clubsVmProvider =
    StateNotifierProvider.autoDispose<ClubsNotifier, AsyncValue<List<ClubDto>>>(
      (ref) {
        final repo = ref.watch(clubsRepoProvider);
        return ClubsNotifier(repo);
      },
    );
