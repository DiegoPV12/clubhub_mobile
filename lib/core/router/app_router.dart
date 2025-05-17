// lib/core/routes/app_router.dart
import 'package:clubhub_mobile/features/auth/presentation/login/login_page.dart';
import 'package:clubhub_mobile/features/auth/presentation/register/register_page.dart';
import 'package:clubhub_mobile/features/clubs/domain/models/event_dto.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_details_page.dart';
import 'package:clubhub_mobile/features/clubs/presentation/club_form_page.dart';
import 'package:clubhub_mobile/features/events/presentation/event_form_page.dart';
import 'package:clubhub_mobile/features/home/presentation/home_shell.dart';
import 'package:clubhub_mobile/features/intro/presentation/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(path: '/welcome', builder: (_, __) => const WelcomePage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterPage()),

      GoRoute(path: '/home', builder: (_, __) => const HomeShell()),

      GoRoute(path: '/clubs/new', builder: (_, __) => const ClubFormPage()),

      GoRoute(
        path: '/clubs/:id',
        builder: (context, state) {
          final clubId = int.parse(state.pathParameters['id']!);
          return ClubDetailPage(clubId);
        },
      ),

      // → Nueva ruta: crear evento
      GoRoute(
        path: '/clubs/:clubId/events/new',
        builder: (context, state) {
          final clubId = int.parse(state.pathParameters['clubId']!);
          return EventFormPage(clubId: clubId);
        },
      ),

      // → Nueva ruta: editar evento
      GoRoute(
        path: '/clubs/:clubId/events/:eventId/edit',
        builder: (context, state) {
          final clubId = int.parse(state.pathParameters['clubId']!);
          final eventDto = state.extra as EventDto;
          return EventFormPage(clubId: clubId, initial: eventDto);
        },
      ),
    ],
  );
});
