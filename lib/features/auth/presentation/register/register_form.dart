import 'package:clubhub_mobile/features/auth/presentation/vm_register.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/app_text_field.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/password_field.dart';
import 'package:clubhub_mobile/features/auth/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _pass2Ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerVmProvider);
    final vm = ref.read(registerVmProvider.notifier);
    ref.listen(registerVmProvider, (p, n) {
      if (n is RegisterSuccess) context.go('/home');
    });

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: _nameCtrl,
            label: 'Nombre',
            icon: Icons.person,
            validator:
                (v) => (v == null || v.trim().isEmpty) ? 'Obligatorio' : null,
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          PasswordField(
            controller: _pass2Ctrl,
            label: 'Repetir contraseña',
            validator: (v) => (v != _passCtrl.text) ? 'No coincide' : null,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Crear cuenta',
            isLoading: state is RegisterLoading,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                vm.register(
                  _nameCtrl.text.trim(),
                  _emailCtrl.text,
                  _passCtrl.text,
                );
              }
            },
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('¿Ya tienes cuenta? Inicia sesión'),
          ),

          if (state is RegisterError)
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
