import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {

  const NewExpense ({super.key});

  State<NewExpense> createState () {
    return _StateNewExpense();
  }
}


class _StateNewExpense extends State<NewExpense> {
  @override
  Widget build(context) {

    return const Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Title'
              )
            ),
          )
        ],
      ),
    );
  }

}