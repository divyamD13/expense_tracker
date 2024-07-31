import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryIconTheme: const IconThemeData(color: Colors.yellow),
      ),
      home: Expenses(),
    ),
  );
}