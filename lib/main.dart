import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor: const Color.fromARGB(255, 250, 189, 252)),
      home: const Expenses(),
    )
  );
}