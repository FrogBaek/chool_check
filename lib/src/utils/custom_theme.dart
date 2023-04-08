import 'package:chool_check/src/utils/index.dart';

class CustomTheme {
  static ThemeMode lightThemeMode = ThemeMode.light;

  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: CustomColor.fullGreen,
          fontSize: 25,
        ),
        bodyMedium: TextStyle(
          color: CustomColor.fullGreen,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.fullGreen,
              textStyle: const TextStyle(
                color: Colors.white,
              ))));
}
