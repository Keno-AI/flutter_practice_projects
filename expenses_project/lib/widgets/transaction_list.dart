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
        ? LayoutBuilder(builder: (ctx,constraints){
          
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight ,
            child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight *0.15,
                    child: Text(
                      'No expenses added yet!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight *0.05  ,
                  ),
                  Container(
                      height: constraints.maxHeight *0.8,
                      child: Image(
                        image: AssetImage('assets/images/waiting.png'),
                        fit: BoxFit.cover,
                      ))
                ],
              ),
          );
        })        
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
                  trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(onPressed: () => deleteTransaction(tx.id), icon: Icon(Icons.delete), label: Text('Delete'),textColor: Colors.red,):
                  IconButton(onPressed: () => deleteTransaction(tx.id), icon: Icon(Icons.delete),color: Colors.red, ),
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