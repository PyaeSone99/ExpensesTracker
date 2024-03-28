import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {

  const NewExpense ({super.key});

  @override
  State<NewExpense> createState () {
    return _StateNewExpense();
  }
}


class _StateNewExpense extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _parentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null ? now : _selectedDate!,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  var _selectedCategory = Category.leisure;

  void _submitExpenseData(){
    final enteredAmount = double.parse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount<= 0 ;
    if (_titleController.text.trim().isEmpty || amountIsValid || _selectedDate == null) {
      //error message here
    }
  }

  @override
  Widget build(context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text(
                'Title'
              )
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text(
                      'Amount'
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null ? 'No Date Selected!' : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _parentDatePicker,
                      icon: const Icon(Icons.calendar_month)
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase()
                    ),
                  )
                ).toList(), 
                onChanged: (value) {
                  if(value == null){
                    return;
                  }
                  setState(() {
                     _selectedCategory = value;
                  });
                }
              ),
              const Spacer(),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text(
                  'Cancel'
                )
              ),
              ElevatedButton(
                onPressed: _submitExpenseData, 
                child: const Text(
                  'Save Expense'
                )
              )
            ],
          )
        ],
      ),
    );
  }

}