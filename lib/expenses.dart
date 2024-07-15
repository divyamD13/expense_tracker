import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
   final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Text('Enter data to open'),
      );
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
        title: const Text('Expense Tracker',
        style: TextStyle(
          fontWeight: FontWeight.w600
        )
        ),
        // actions: [
        //   Drawer(),
        // ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses
              )),
              FloatingActionButton(onPressed: _openAddExpenseOverlay,
              child: const Icon(Icons.add),
              backgroundColor: Colors.yellow,
             ),
        ],
      ),
    );
  }
}