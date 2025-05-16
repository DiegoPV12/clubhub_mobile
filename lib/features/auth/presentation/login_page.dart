import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vm_login.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginVmProvider);
    final vm = ref.read(loginVmProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Correo'),
                validator:
                    (v) =>
                        (v == null || !v.contains('@'))
                            ? 'Correo inválido'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator:
                    (v) =>
                        (v == null || v.length < 6)
                            ? 'Mínimo 6 caracteres'
                            : null,
              ),
              const SizedBox(height: 24),
              _buildButton(state, vm),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(LoginState state, LoginViewModel vm) {
    if (state is LoginLoading) {
      return const CircularProgressIndicator();
    } else if (state is LoginError) {
      return Text(state.message, style: const TextStyle(color: Colors.red));
    } else {
      return FilledButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            vm.login(_emailCtrl.text, _passCtrl.text);
          }
        },
        child: const Text('Iniciar'),
      );
    }
  }
}
