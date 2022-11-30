
import 'package:flutter/material.dart';
import 'package:interview_task/ui/themes/colors.dart';
import 'package:interview_task/ui/utils/colors_helpers.dart';

ThemeData themeData = ThemeData(
  primarySwatch: createMaterialColor(
    AppColors.greenDark,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.greenDark,
    secondary: AppColors.orange,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Poppins',
);