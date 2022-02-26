import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

const primaryColor50 = Color(0xFFF3EFFF);
const grey500 = Color(0xFF626E75);

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    backgroundColor: const Color(0xFFF5F6F7),
    primaryColor: const Color(0xFF077DBB),
    // primaryColorDark: Color(0xFF000000),
    primaryColorLight: const Color(0xFFD9F2FF),
    secondaryHeaderColor: const Color(0xFF96324A),
    dividerColor: const Color(0xFFBAC9D1),
    textTheme: const TextTheme().copyWith(
      bodyText1: const TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontFamily: "Programme",
      ),
      bodyText2: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontFamily: "Programme",
      ),
      headline6: const TextStyle(
        color: Colors.black,
        fontFamily: "Programme",
      ),
      headline5: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Programme",
      ),
    ),
    iconTheme:
        const IconThemeData(color: Color(0xFF077DBB), opacity: 0.8, size: 24),
    colorScheme:
        const ColorScheme.light().copyWith(secondary: const Color(0xFFF1EBF7)),
  );
}
