import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
    });

    final List<Expense> expenses;
    final void Function (Expense expense) onRemoveExpense;   
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx,index)=>Dismissible(
        key:ValueKey(expenses[index]),
        background: Container(
          height: 20,
          color: Theme.of(context).colorScheme.error.withOpacity(0.65),
          child: const Center(child:Text('Delete Expense')),
        ),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        child:ExpenseItem(expenses[index]),
      )
      );
  }
}