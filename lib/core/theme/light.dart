import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// —— 1. TOKENS ————————————————————————————————————————————————
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

class AppRadius {
  static const sm = Radius.circular(8);
  static const md = Radius.circular(12);
  static const lg = Radius.circular(20);
}

/// —— 2. COLOR SCHEME ——————————————————————————————
const _seed = Color(0xFF6750A4); // lila ClubHub
final _scheme = ColorScheme.fromSeed(
  seedColor: _seed,
  brightness: Brightness.light,
).copyWith(primary: _seed); // forzamos primario exacto

/// —— 3. TYPOGRAPHY (Inter) ——————————————————————————
final _baseText = GoogleFonts.montserratTextTheme().apply(
  bodyColor: _scheme.onSurface,
  displayColor: _scheme.onSurface,
);

final TextTheme _textTheme = _baseText.copyWith(
  // Headlines (display)
  headlineLarge: _baseText.headlineLarge?.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    decorationColor: Colors.black,
    decorationThickness: 2,
  ),
  headlineMedium: _baseText.headlineMedium?.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  headlineSmall: _baseText.headlineSmall?.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),

  // Titles
  titleLarge: _baseText.titleLarge?.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  ),
  titleMedium: _baseText.titleMedium?.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: _baseText.titleSmall?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  ),

  // Bodies (ya los tenías)
  bodyLarge: _baseText.bodyLarge?.copyWith(fontSize: 16),
  bodyMedium: _baseText.bodyMedium?.copyWith(fontSize: 14),
  bodySmall: _baseText.bodySmall?.copyWith(fontSize: 12),

  // Opcional: labels
  labelLarge: _baseText.labelLarge?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
);

/// —— 4. COMPONENT THEMES ——————————————————————————
final _filledButton = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    minimumSize: const Size.fromHeight(56),
    padding: const EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    textStyle: _textTheme.labelLarge,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    minimumSize: const Size.fromHeight(56),
    foregroundColor: _scheme.primary,
    side: BorderSide(color: _scheme.primary),
    padding: const EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    textStyle: _textTheme.labelLarge,
  ),
);

final _inputDecoration = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: _scheme.primary, width: 1.5),
  ),
);

/// —— 5. THEME DATA ——————————————————————————————
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _scheme,
  textTheme: _textTheme,
  filledButtonTheme: _filledButton,
  outlinedButtonTheme: _outlinedButton,
  inputDecorationTheme: _inputDecoration,
);
