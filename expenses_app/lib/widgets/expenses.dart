import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.leisure
    ),

    Expense(
        title: 'Party',
        amount: 70.05,
        date: DateTime.now(),
        category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay(){
    // => Text(... er eins og að gera fall og return
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Column(
        children: [

          const Text('The chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses
            ),
          ),
        ],
      ),
    );
  }
}