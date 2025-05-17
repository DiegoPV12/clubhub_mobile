import 'package:clubhub_mobile/features/auth/presentation/register/register_page.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_details_page.dart';
import 'package:clubhub_mobile/features/home/presentation/home_shell.dart';
import 'package:clubhub_mobile/features/intro/presentation/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login/login_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', redirect: (_, __) => '/home'),
      GoRoute(path: '/home', builder: (_, __) => const HomeShell()),
      GoRoute(path: '/welcome', builder: (_, __) => const WelcomePage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),
      GoRoute(
        path: '/clubs/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ClubDetailPage(id);
        },
      ),
    ],
  );
});
