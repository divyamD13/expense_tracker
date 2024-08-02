import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label:"UNDO", 
          onPressed:(){
            setState(() {
              _registeredExpenses.insert(expenseIndex,expense);
            });
          }),
        ));
  }

  void _openAddExpenseOverlay() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense),
      );
  
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent=const Center(
      child: Text('No Expenses added yet. \n    Start adding some!',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent= ExpenseList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
              );
    }
    return Scaffold(

      appBar: AppBar(
        title: const  Center(
          child: Text('Expense Tracker',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
          )
          ),
        ),
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
            child:mainContent,
            ),
              FloatingActionButton(onPressed: _openAddExpenseOverlay,
              child: const Icon(Icons.add),
             ),
          
        ],
      ),
    );
  }
}