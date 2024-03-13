import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/local/local_storage.dart';
import 'package:mvc_flutter/ui/themes/colors.dart';
import 'package:mvc_flutter/ui/utils/base_class/view_model.dart';

class ThemeNotifier extends ViewModel {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    Prefs.theme.set(value.name);
    notifyListeners();
  }

  void setTheme(String theme) {
    ThemeMode mode = ThemeMode.values.firstWhere((e) => e.name == theme);
    themeMode = mode;
  }

  bool selectedTheme(String mode) {
    return themeMode.name == mode;
  }

  void getTheme() {
    if (Prefs.theme.getSafe() != null) {
      themeMode = ThemeMode.values.firstWhere(
        (e) => e.name == Prefs.theme.get(),
      );
    }
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.appColor,
    shadowColor: Colors.black,
    primarySwatch: createMaterialColor(AppColors.appColor),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    useMaterial3: true,
    hoverColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    canvasColor: AppColors.appColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 2,
      alignment: Alignment.center,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.appColor,
    primarySwatch: createMaterialColor(AppColors.appColor),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    shadowColor: Colors.white,
    hintColor: Colors.black,
    splashFactory: NoSplash.splashFactory,
    useMaterial3: true,
    hoverColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    canvasColor: AppColors.appColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Inter',
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 2,
      alignment: Alignment.center,
    ),
  );
}

MaterialColor createMaterialColor(Color color) {
  final List strengths = <double>[.05];
  final Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch as dynamic);
}
