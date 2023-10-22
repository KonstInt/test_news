import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _MyColorsLight.kColorBlue,
      secondary: _MyColorsLight.kColorGray,
      shadow: _MyColorsLight.kColorGrayLight,
      onBackground: _MyColorsLight.kColorBackElevated,
      background: _MyColorsLight.kColorBackPrimary,
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _MyColorsLight.kColorBackPrimary,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: _MyColorsLight.kColorBackPrimary,
    primaryColor: _MyColorsLight.kColorBlue,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 30,
          height: (36 / 30),
        ),
      ),
      titleMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: (32 / 20),
        ),
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: (20 / 16),
        ),
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: (20 / 14),
        ),
      ),
      labelLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: (24 / 14),
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: _MyColorsLight.kColorBlue.withOpacity(0.3),
      selectionHandleColor: _MyColorsLight.kColorBlue,
    ),
    iconTheme: const IconThemeData(color: _MyColorsLight.kLabelTertiary),
    dividerTheme: const DividerThemeData(color: _MyColorsLight.kSeparatorColor),
  );
}

class _MyColorsLight {
  static const Color kSeparatorColor = Color(0x33000000);
  static const Color kLabelPrimary = Color(0xFF000000);
  static const Color kLabelTertiary = Color(0x4D000000);
  static const Color kColorBlue = Color(0xFF007AFF);
  static const Color kColorGray = Color(0xFF8E8E93);
  static const Color kColorGrayLight = Color(0xFFD1D1D6);
  static const Color kColorBackPrimary = Color(0xFFF7F6F2);
  static const Color kColorBackSecondary = Color(0xFFFFFFFF);
  static const Color kColorBackElevated = Color(0xFFFFFFFF);
}
