import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define your custom dark theme
final ThemeData customDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,

  fontFamily: GoogleFonts.roboto().fontFamily,

  // --- TEXT THEME CONFIGURATION (to make text white) ---
  textTheme:
      GoogleFonts.robotoTextTheme(
        // Use Roboto text theme as a base
        ThemeData(
          brightness: Brightness.dark,
        ).textTheme, // Apply to a dark theme context
      ).copyWith(
        // Apply white color to the base styles from robotoTextTheme
        bodyLarge: GoogleFonts.roboto(color: Colors.white),
        bodyMedium: GoogleFonts.roboto(
          color: Colors.white,
        ), // Default text style
        bodySmall: GoogleFonts.roboto(color: Colors.white),
        displayLarge: GoogleFonts.roboto(color: Colors.white),
        displayMedium: GoogleFonts.roboto(color: Colors.white),
        displaySmall: GoogleFonts.roboto(color: Colors.white),
        headlineLarge: GoogleFonts.roboto(color: Colors.white),
        headlineMedium: GoogleFonts.roboto(color: Colors.white),
        headlineSmall: GoogleFonts.roboto(color: Colors.white),
        titleLarge: GoogleFonts.roboto(color: Colors.white),
        titleMedium: GoogleFonts.roboto(color: Colors.white),
        titleSmall: GoogleFonts.roboto(color: Colors.white),
        labelLarge: GoogleFonts.roboto(color: Colors.white),
        labelMedium: GoogleFonts.roboto(color: Colors.white),
        labelSmall: GoogleFonts.roboto(color: Colors.white),
      ),

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent, // Choose a seed appropriate for dark theme
    brightness: Brightness.dark,
    // Ensure contrast with white text if using this seed for component backgrounds
    // You might want to override some generated colors:
    // primary: Colors.blueAccent,
    // onPrimary: Colors.white, // Text on primary color buttons
    surface: Colors.grey[850], // Example: Slightly off-black for cards
    onSurface: Colors.white, // Text on cards, dialogs, etc.
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black45,
    foregroundColor: Colors.white, // Affects title and icons in AppBar
    elevation: 0,
  ),
  // Add other theme customizations (buttons, cards, etc.)
  // e.g. elevatedButtonTheme, textButtonTheme
);
