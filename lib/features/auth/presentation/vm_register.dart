import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository.dart';

// — Estados —
sealed class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
}

// — VM —
class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel(this._repo) : super(const RegisterInitial());

  final AuthRepository _repo;

  Future<void> register(String name, String email, String pass) async {
    state = const RegisterLoading();
    try {
      final tokens = await _repo.register(name, email, pass);
      // TODO: save tokens in I-3
      // ignore: avoid_print
      print('JWT recibido (register): ${tokens.jwt}');
      state = const RegisterSuccess();
    } catch (e) {
      state = RegisterError(e.toString());
    }
  }
}

final registerVmProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>((ref) {
      final repo = ref.watch(authRepoProvider);
      return RegisterViewModel(repo);
    });
