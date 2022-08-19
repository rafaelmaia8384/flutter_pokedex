import 'package:flutter/material.dart';

//Sprites
//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png

class AppConfig {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  static const String basePngUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
  static const double maxPageWidth = 800.0;

  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
        secondary: Colors.blue,
      ),
      errorColor: const Color.fromRGBO(4, 31, 84, 1.0),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(4, 31, 84, 1.0),
        ),
        counterStyle: const TextStyle(
          fontSize: 12,
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          color: Colors.red.shade800,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(4, 31, 84, 1.0),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(4, 31, 84, 1.0),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromRGBO(4, 31, 84, 1.0),
            width: 2,
          ),
        ),
      ),
    );
  }
}
