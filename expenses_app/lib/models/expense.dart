import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work } // býr til custom value sem við búum til

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

}