import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
 
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white, 
    titleTextStyle: TextStyle(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black), 
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black, 
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
