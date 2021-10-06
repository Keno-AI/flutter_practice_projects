import 'dart:ffi';

import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  

  final List<Transaction> user_transactions = [
    Transaction(
        id: "id1",
        title: "Puma Rebound Joy",
        amount: 98.63,
        date: DateTime.now()),
    Transaction(
        id: "id2", title: "QR jeans", amount: 48.35, date: DateTime.now()),
  ];


  void addTx(String inputTitle,double inputAmount){
    
    final newTx =  Transaction(id: DateTime.now().toString(), title: inputTitle, amount: inputAmount, date: DateTime.now());

    setState(() {
      user_transactions.add(newTx);
    });
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Column(children: [NewTransaction(addTx),
            TransactionList(user_transactions),],);
  }
}