import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewExpense extends StatefulWidget {

  const NewExpense ({super.key});

  State<NewExpense> createState () {
    return _StateNewExpense();
  }
}


class _StateNewExpense extends State<NewExpense> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _parentDatePicker (){
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1,now.month,now.day);
    showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: now);
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
                    const Text(
                      'Selected Date'
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
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text(
                  'Cancel'
                )
              ),
              ElevatedButton(
                onPressed: (){
                
                }, 
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