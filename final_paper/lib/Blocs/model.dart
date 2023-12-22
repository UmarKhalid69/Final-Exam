import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionModel {
  String? id;
  String? title;
  String? icon;
  int? amount;
  String? date;
  bool? transactionType;

  TransactionModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.icon,
      required this.transactionType});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      icon: json['icon'],
      date: json['date'],
      transactionType: json['transactionType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'date': date,
        'transactionType': transactionType,
      };
}
