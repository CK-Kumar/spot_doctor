import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final fontFamily = GoogleFonts.roboto().toString();
final titleTextStyle = TextStyle(
    color: const Color(0xFF374AE3),
    fontFamily: fontFamily,
    fontWeight: FontWeight.w800,
    fontSize: 20.sp);

final displayText = TextStyle(
    color: const Color(0xFF374AE3),
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 40.sp);

final linkText = TextStyle(
    color: const Color(0xFF374AE3),
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    decoration: TextDecoration.underline);

class Style {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF374AE3),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDFE0FF),
    onPrimaryContainer: Color(0xFF000A64),
    secondary: Color(0xFF5B5D72),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE0E0F9),
    onSecondaryContainer: Color(0xFF181A2C),
    tertiary: Color(0xFF265DAE),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD7E2FF),
    onTertiaryContainer: Color(0xFF001A40),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1B1B1F),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1B1B1F),
    surfaceVariant: Color(0xFFE3E1EC),
    onSurfaceVariant: Color(0xFF46464F),
    outline: Color(0xFF777680),
    onInverseSurface: Color(0xFFF3F0F4),
    inverseSurface: Color(0xFF303034),
    inversePrimary: Color(0xFFBCC2FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF374AE3),
    outlineVariant: Color(0xFFC7C5D0),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBCC2FF),
    onPrimary: Color(0xFF00169D),
    primaryContainer: Color(0xFF142BCC),
    onPrimaryContainer: Color(0xFFDFE0FF),
    secondary: Color(0xFFC4C5DD),
    onSecondary: Color(0xFF2D2F42),
    secondaryContainer: Color(0xFF444559),
    onSecondaryContainer: Color(0xFFE0E0F9),
    tertiary: Color(0xFFACC7FF),
    onTertiary: Color(0xFF002F67),
    tertiaryContainer: Color(0xFF004491),
    onTertiaryContainer: Color(0xFFD7E2FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1B1B1F),
    onBackground: Color(0xFFE4E1E6),
    surface: Color(0xFF1B1B1F),
    onSurface: Color(0xFFE4E1E6),
    surfaceVariant: Color(0xFF46464F),
    onSurfaceVariant: Color(0xFFC7C5D0),
    outline: Color(0xFF91909A),
    onInverseSurface: Color(0xFF1B1B1F),
    inverseSurface: Color(0xFFE4E1E6),
    inversePrimary: Color(0xFF374AE3),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFBCC2FF),
    outlineVariant: Color(0xFF46464F),
    scrim: Color(0xFF000000),
  );
}
