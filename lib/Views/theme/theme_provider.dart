// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class ThemeProvider extends ChangeNotifier {
//   late Color _primaryColor;
//   ThemeMode _themeMode = ThemeMode.system;

//   ThemeProvider() {
//     _primaryColor = Color.fromRGBO(241, 218, 221, 1);

//     loadTheme();
//   }

//   Color get primaryColor => _primaryColor;
//   ThemeMode get themeMode => _themeMode;

//   // DARK THEME

//   ThemeData get darkTheme => ThemeData(
//     brightness: Brightness.dark,

//     primaryColor: Color(0xFF0F0F0F),
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: _primaryColor,
//       brightness: Brightness.dark,
//     ),

//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.black,

//       centerTitle: true,
//       iconTheme: const IconThemeData(color: Colors.white), // For back icon
//       titleTextStyle: GoogleFonts.lora(
//         color: Colors.white,
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     scaffoldBackgroundColor:Colors.white,
//     textTheme: TextTheme(
//       bodySmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       bodyMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       bodyLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       displaySmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       displayMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       displayLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//     ),
//   );

//   ///
//   ///LIGHT THEME
//   ///
//   ThemeData get lightTheme => ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.white,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: _primaryColor,
//       brightness: Brightness.light,
//     ),
//     appBarTheme: AppBarTheme(
//       backgroundColor: _primaryColor,
//       centerTitle: true,
//       iconTheme: const IconThemeData(color: Colors.black), // For back icon
//       titleTextStyle: GoogleFonts.lora(
//         color: Colors.grey.shade900,
//         fontSize: 16,
//         fontWeight: FontWeight.w900,
//       ),
//     ),
//     scaffoldBackgroundColor: Colors.white,
//     // scaffoldBackgroundColor: Colors.grey.shade100,
//     textTheme: TextTheme(
//       bodySmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       bodyMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       bodyLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       labelLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       titleLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineSmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       headlineLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//       displaySmall: GoogleFonts.lora(color: Colors.grey.shade900),
//       displayMedium: GoogleFonts.lora(color: Colors.grey.shade900),
//       displayLarge: GoogleFonts.lora(color: Colors.grey.shade900),
//     ),
//   );

//   /// Update theme mode (light/dark/system)
//   void setThemeMode(ThemeMode mode) {
//     _themeMode = mode;
//     saveThemeMode(mode);
//     notifyListeners();
//   }

//   /// Change primary color
//   void changeColor(Color color) {
//     _primaryColor = color;
//     saveThemeColor(color);
//     notifyListeners();
//   }

//   /// Save selected color
//   Future<void> saveThemeColor(Color color) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('theme_color', color.value);
//   }

//   /// Save selected theme mode
//   Future<void> saveThemeMode(ThemeMode mode) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('theme_mode', mode.toString().split('.').last);
//   }

//   /// Load saved theme and color
//   Future<void> loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();

//     // Load color
//     int? colorValue = prefs.getInt('theme_color');
//     if (colorValue != null) {
//       _primaryColor = Color(colorValue);
//     }

//     // Load theme mode
//     String? modeString = prefs.getString('theme_mode');
//     if (modeString != null) {
//       _themeMode = ThemeMode.values.firstWhere(
//         (e) => e.toString().split('.').last == modeString,
//         orElse: () => ThemeMode.system,
//       );
//     }

//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _colorKey = 'theme_color';
  static const String _modeKey = 'theme_mode';

  late Color _primaryColor;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _primaryColor = const Color.fromRGBO(241, 218, 221, 1);
    loadTheme();
  }

  Color get primaryColor => _primaryColor;
  ThemeMode get themeMode => _themeMode;

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0F0F0F),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.lora(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    scaffoldBackgroundColor: Colors.black,
  );

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.lora(
        color: Colors.grey.shade900,
        fontSize: 16,
        fontWeight: FontWeight.w900,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.loraTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ).apply(bodyColor: Colors.black, displayColor: Colors.grey.shade500),
  );

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    saveThemeMode(mode);
    notifyListeners();
  }

  void changeColor(Color color) {
    _primaryColor = color;
    saveThemeColor(color);
    notifyListeners();
  }

  Future<void> saveThemeColor(Color color) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt(_colorKey, color.value);
    } catch (_) {}
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_modeKey, mode.toString().split('.').last);
    } catch (_) {}
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    int? colorValue = prefs.getInt(_colorKey);
    if (colorValue != null) {
      _primaryColor = Color(colorValue);
    }
    String? modeString = prefs.getString(_modeKey);
    if (modeString != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString().split('.').last == modeString,
        orElse: () => ThemeMode.system,
      );
    }
    notifyListeners();
  }
}
