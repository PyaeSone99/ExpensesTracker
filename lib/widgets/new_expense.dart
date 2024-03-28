import 'package:flutter/material.dart';

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
          SizedBox(height: 10,),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text(
                'Amount'
              ),
            ),
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