import 'package:clubhub_mobile/features/auth/presentation/vm_login.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/app_text_field.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/password_field.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginVmProvider);
    final vm = ref.read(loginVmProvider.notifier);
    ref.listen(loginVmProvider, (prev, next) {
      if (next is LoginSuccess) context.go('/home');
    });

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: _emailCtrl,
            label: 'Correo',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator:
                (v) =>
                    (v == null || !v.contains('@')) ? 'Correo inválido' : null,
          ),
          const SizedBox(height: 16),
          PasswordField(
            controller: _passCtrl,
            label: 'Contraseña',
            validator:
                (v) =>
                    (v == null || v.length < 6) ? 'Mínimo 6 caracteres' : null,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Iniciar sesión',
            isLoading: state is LoginLoading,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                vm.login(_emailCtrl.text, _passCtrl.text);
              }
            },
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go('/register'),
            child: const Text('¿No tienes cuenta? Regístrate'),
          ),

          if (state is LoginError)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
