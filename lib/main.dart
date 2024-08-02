import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme=ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 236, 105, 40));
var kDarkColorScheme=ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 255, 94, 0));
void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge:const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ) 

      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme:ThemeData().textTheme.copyWith(
          titleLarge:const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleMedium: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )  
      ),
      themeMode: ThemeMode.light,
      home: Expenses(),
    ),
  );
}