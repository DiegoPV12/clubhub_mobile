import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/theme/light.dart';

class ClubHubApp extends ConsumerWidget {
  const ClubHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'ClubHub',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,

      // ---  LOCALIZACIONES  ---
      supportedLocales: const [
        Locale('es'), // Español
        Locale('en'), // Inglés (fallback)
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
