import 'package:flutter/material.dart';

/// 3-color theme system: primary (card), secondary (accents/shadows),
/// tertiary (highlights/buttons/borders).
class AppTheme {
  AppTheme._();

  static ThemeData _build({
    required Color primary,
    required Color secondary,
    required Color tertiary,
    required Brightness brightness,
  }) {
    final scheme = ColorScheme.fromSeed(
      seedColor: tertiary,
      primary: tertiary,
      secondary: secondary,
      tertiary: tertiary,
      surface: primary,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: primary,
    );
  }

  // Default Premium: white / black / gold
  static final ThemeData defaultPremium = _build(
    primary: Colors.white,
    secondary: Colors.black,
    tertiary: const Color(0xFFD4AF37),
    brightness: Brightness.light,
  );

  // Night Deck: charcoal / deep black / neon blue
  static final ThemeData nightDeck = _build(
    primary: const Color(0xFF1E1E1E),
    secondary: Colors.black,
    tertiary: const Color(0xFF00E5FF),
    brightness: Brightness.dark,
  );

  // Soft Vinyl: cream / warm brown / orange-gold
  static final ThemeData softVinyl = _build(
    primary: const Color(0xFFFFF8E7),
    secondary: const Color(0xFF5D4037),
    tertiary: const Color(0xFFE08E45),
    brightness: Brightness.light,
  );
}

/// Default mood palette. Colors are customizable at runtime via Settings.
class MoodColors {
  MoodColors._();
  static const chill = Color(0xFF87CEEB);
  static const happy = Color(0xFFFFD93D);
  static const focus = Color(0xFF4CAF50);
  static const sad = Color(0xFF1E5AAF);
  static const hype = Color(0xFFFF7043);
  static const romantic = Color(0xFFEC407A);
}
