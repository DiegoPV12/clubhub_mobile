// lib/features/auth/presentation/vm_login.dart
import 'package:clubhub_mobile/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(this._repo) : super(const LoginInitial());

  final AuthRepository _repo;

  Future<void> login(String email, String password) async {
    state = const LoginLoading();
    try {
      final tokens = await _repo.login(email, password);
      // TODO: save tokens securely later
      // ignore: avoid_print
      print('JWT recibido: ${tokens.jwt}');
      state = const LoginSuccess();
    } catch (e) {
      state = LoginError(e.toString());
    }
  }
}

final loginVmProvider = StateNotifierProvider<LoginViewModel, LoginState>((
  ref,
) {
  final repo = ref.watch(authRepoProvider);
  return LoginViewModel(repo);
});
