import 'package:flutter/material.dart';

class Font {
  var _textStyle = const TextStyle();

  TextStyle get s30 => _textStyle.copyWith(fontSize: 30);

  TextStyle get s20 => _textStyle.copyWith(fontSize: 20);

  TextStyle get s18 => _textStyle.copyWith(fontSize: 18);

  TextStyle get s16 => _textStyle.copyWith(fontSize: 16);

  TextStyle get s14 => _textStyle.copyWith(fontSize: 14);

  TextStyle get s13 => _textStyle.copyWith(fontSize: 13);

  TextStyle get s12 => _textStyle.copyWith(fontSize: 12);
}

class Poppins extends Font {
  Poppins.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  Poppins.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  Poppins.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
}
