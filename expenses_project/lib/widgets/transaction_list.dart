import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
          child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            padding: EdgeInsets.all(10),
            child: Text(tx.amount.toStringAsFixed(2) + '\$'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tx.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(DateFormat.yMMMd().add_Hm().format(tx.date))
            ],
          )
        ],
      ));
    }).toList());
  }
}
