import 'package:expenses_project/widgets/new_transactions.dart';
import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import '../widgets/new_transactions.dart';
import '../widgets/chart.dart';
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> user_transactions = [
    Transaction(
        id: "id1",
        title: "Puma Rebound Joy",
        amount: 98.63,
        date: DateTime.now().subtract(Duration(days:1))
        ),
    Transaction(
        id: "id2", title: "QR jeans", amount: 48.35, date: DateTime.now().subtract(Duration(days:2))),
  ];

  void addTx(String inputTitle, double inputAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        amount: inputAmount,
        date: DateTime.now());

    setState(() {
      user_transactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(addTx),
          ); //onTap: (){},behavior: HitTestBehavior.opaque
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expenses App'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  startAddNewTransaction(context);
                },
                icon: Icon(
                  Icons.add_box,
                ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            startAddNewTransaction(context);
          },
          child: Icon(
            Icons.add_box,
            color: Colors.white,
          ),
        ),
        body: ListView(children: [
          Chart(user_transactions),
          user_transactions.isEmpty
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
              :  TransactionList(user_transactions),
        ]));
  }
}
