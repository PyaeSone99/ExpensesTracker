import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum Category {
  food,taravel,leisure,work
}

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.taravel : Icons.flight_takeoff,
  Category.leisure : Icons.movie,
  Category.work : Icons.work
};

class Expense {

  Expense({required this.title,required this.amount,required this.date,required this.category}) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date); 
  }
}