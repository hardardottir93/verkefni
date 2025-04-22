import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses,});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //birtir bara það sem á að birtast en er ekki að búa til allt sem á að sjást..
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}