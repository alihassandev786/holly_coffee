import 'package:flutter/material.dart';
import 'package:hollycoffee/core/apptheme/appcolors.dart';
import 'package:google_fonts/google_fonts.dart';

final myPadding = 16;

class Apptheme {
  Apptheme._();

  static ThemeData get lightTheme => _buildTheme();
  static ThemeData get darkTheme => _buildTheme(isDark: true);

  static ThemeData _buildTheme({bool isDark = false}) {
    final background = isDark ? Colors.black : AppColors.bgcolor;

    final surface = isDark ? AppColors.secondary : AppColors.surfaceVariant;

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,

      scaffoldBackgroundColor: background,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.bgcolor,
          minimumSize: Size(myPadding / 1, myPadding / 25),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(myPadding / 2),
          ),
        ),
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: AppColors.primary,
        surface: surface,
      ),
      cardTheme: CardThemeData(
        color: AppColors.bgcolor,
        elevation: 20,
        shadowColor: AppColors.textcolor1,
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(myPadding * 1),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bgcolor,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.border,
        selectedIconTheme: IconThemeData(size: myPadding * 2),
        unselectedIconTheme: IconThemeData(size: myPadding * 2),
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        elevation: 10,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
