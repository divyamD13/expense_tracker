import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});

  final void Function (Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {

  final _expenseTitleController = TextEditingController();
  final _expenseAmountController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory=Category.leisure;

  void _presentDatePicker()async {
    final now=DateTime.now();
    final firstDate=DateTime(now.year-1,now.month,now.day);
    final pickedDate= await showDatePicker(context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now
      );
      setState(() {
        selectedDate = pickedDate;
      });
  }

  void submitExpenseData(){
    final enteredAmount=double.tryParse(_expenseAmountController.text);
    final amountIsValid=enteredAmount!=null && enteredAmount<=0;
    if(_expenseTitleController.text.trim().isEmpty || amountIsValid||selectedDate==null){
      showDialog(
        context: context,
        builder:(ctx)=>AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please make sure a valid expense title, amount, and date are provided.'),
          actions:[
            TextButton(
              child: Text('OK'),
              onPressed: ()=>Navigator.pop(context),
            )
          ]
        )
        );
        return;
    }
    widget.onAddExpense(Expense(
      title: _expenseTitleController.text,
      amount: enteredAmount!,
      category: _selectedCategory, 
      date: selectedDate!));

      Navigator.pop(context);
  }

  void dispose(){
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,70,16,16),
      child: Column(
        children: [
          TextField(
            controller:_expenseTitleController,
            keyboardType:TextInputType.text,
            decoration: const InputDecoration(
              label:Text('Expense Title'),
            ),
          ),
          Row(children: [
            Expanded(
              child: TextField(
                controller:_expenseAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label:Text('Amount'),
                  prefixText: '₹ ',
                ),
              ),
            ), 
            const SizedBox(width: 30,),
            Expanded(
              child: Row(children: [
               Text(selectedDate==null? 'No Date Selected':formatter.format(selectedDate!)),
              IconButton(onPressed:
                _presentDatePicker,
              icon: const Icon(Icons.calendar_month_sharp, size: 24,color: Colors.black,),)
              ],),
            )
          ],),
          const SizedBox(height: 10,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:Category.values.map((category) =>
                 DropdownMenuItem(
                  value: category,
                  child: Text(
                  category.name.toUpperCase()),
                )).toList(),
                onChanged:(value){
                  if(value==null){
                    return;
                }
                setState(() {
                  _selectedCategory = value;
                });
                }
              ),
              const SizedBox(width: 10,),
              TextButton(onPressed: 
              (){
                Navigator.pop(context);
              },
               child:const Text('Cancel'),
              ),
              const SizedBox(width: 5,),
              ElevatedButton(onPressed: 
                submitExpenseData,
               child: const Text('Add Expense')),
            ],
          )
        ],
      ),
    );
  }
}