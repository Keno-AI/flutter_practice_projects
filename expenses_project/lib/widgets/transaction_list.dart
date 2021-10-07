import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  'No expenses added yet!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 100,
                    child: Image(
                      image: AssetImage('assets/images/waiting.png'),
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          )
        : ListView(
                children: transactions.map((tx) {
              return Card(
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 25,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text(tx.amount.toStringAsFixed(2) + '\$')))),
                  title: Text(
                    tx.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(DateFormat.yMMMd().format(tx.date)),
                  trailing: IconButton(onPressed: () => deleteTransaction(tx.id), icon: Icon(Icons.delete), ),
                ),
              );
            }).toList());
  }
}



// Card(
//           child: Row(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Theme.of(context).primaryColor, width: 3),
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//             ),
//             padding: EdgeInsets.all(10),
//             child: Text(tx.amount.toStringAsFixed(2) + '\$'),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                   tx.title,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//               ),
//               Text(DateFormat.yMMMd().add_Hm().format(tx.date))
//             ],
//           )
//         ],
//       ))