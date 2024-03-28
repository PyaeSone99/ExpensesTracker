import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {

  const NewExpense ({super.key});

  State<NewExpense> createState () {
    return _StateNewExpense();
  }
}


class _StateNewExpense extends State<NewExpense> {

  final _titleControler = TextEditingController();

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleControler,
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text(
                'Title'
              )
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  print(_titleControler.text);
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