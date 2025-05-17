// lib/features/auth/presentation/widgets/auth_scaffold.dart
import 'package:clubhub_mobile/core/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

// widgets/auth_scaffold.dart
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.child, this.showBack = false});
  final Widget child;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar:
          showBack
              ? AppBar(
                leadingWidth: 52,
                titleSpacing: 0,
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                  ), // mueve un poco desde el borde
                  child: CustomBackButton(
                    route: '/welcome',
                    style: BackButtonStyle.circle,
                    size: 32, // diámetro 32dp
                    color: Colors.black,
                  ),
                ),

                backgroundColor: cs.primary,
              )
              : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cs.primary, cs.primaryContainer],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo_2.png', height: 240),
                  Text(
                    'ClubHub',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
