import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work } // býr til custom value sem við búum til

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); //býr til unique id og setur á hlutinn.

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //í staðinn fyrir að gera getFormatted date - fall er hægt að gera:
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
   : expenses = allExpenses
    .where((expense) => expense.category == category)
    .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }

}