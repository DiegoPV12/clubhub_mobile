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
final _baseText = GoogleFonts.interTextTheme().apply(
  bodyColor: _scheme.onSurface,
  displayColor: _scheme.onSurface,
);

TextTheme _textTheme = _baseText.copyWith(
  titleLarge: _baseText.titleLarge?.copyWith(fontWeight: FontWeight.w700),
  bodyLarge: _baseText.bodyLarge?.copyWith(fontSize: 16),
  bodyMedium: _baseText.bodyMedium?.copyWith(fontSize: 14),
  bodySmall: _baseText.bodySmall?.copyWith(fontSize: 12),
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
