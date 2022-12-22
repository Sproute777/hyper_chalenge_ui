import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TypographyUtils on BuildContext   {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;

  TextTheme get _textTheme => GoogleFonts.dmSansTextTheme(theme.textTheme);
 ///40  bold
  TextStyle? get displaySmall => _textTheme.displaySmall; //40 
   
 ///30  bold
  TextStyle? get h1 => _textTheme.headlineLarge; //22 
 ///22  bold
  TextStyle? get h2 => _textTheme.headlineMedium; //22 
  ///20 bold
  TextStyle? get h3 => _textTheme.headlineMedium; //20
  ///18 bold
  TextStyle? get h4 => _textTheme.headlineSmall; //18 
  ///16 bold
  TextStyle? get titleLarge => _textTheme.titleMedium;//16 
  ///14 bold
  TextStyle? get titleMedium => _textTheme.titleMedium;//14 
  ///12 bold
  TextStyle? get titleSmall => _textTheme.titleSmall;// 12 

  ///16 regular
  TextStyle? get bodyLarge => _textTheme.labelSmall;//16
  /// 14 regular
  TextStyle? get bodyMedium => _textTheme.bodyLarge;//14 
  /// 12 regular 
  TextStyle? get bodySmall => _textTheme.bodyMedium;//12

  /// 10 regular
  TextStyle? get caption => _textTheme.bodySmall; 
  
}

