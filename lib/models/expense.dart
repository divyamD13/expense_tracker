import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid=Uuid();

final formatter = DateFormat.yMd();

enum Category{
  food,
  travel,
  work,
  leisure
}

const categoryIcons= {
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight,
  Category.work :Icons.work,
  Category.leisure:Icons.movie_creation_rounded,
};
class Expense{
Expense({
 required this.title,
 required this.amount,
 required this.date,
 required this.category,
}) : id = uuid.v4();

   final String id;
   final double amount;
   final String title;
   final DateTime date;
   final Category category;

String get formattedDate{
    return formatter.format(date);
}
}