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

  void addTx(String inputTitle, double inputAmount, DateTime date  ) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: inputTitle,
        amount: inputAmount,
        date: date);

    setState(() {
      user_transactions.add(newTx);
    });
  }

  void deleteTx(String idTx){
    setState(() {
      user_transactions.removeWhere((element) => element.id == idTx);
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
    final appBar = AppBar(
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
          ],);
    return Scaffold(
        appBar: appBar,
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
        body: Container(
          height: (MediaQuery.of(context).size.height  - appBar.preferredSize.height - MediaQuery.of(context).padding.top),
          child: Column(children: [
            Container(height: (MediaQuery.of(context).size.height  - appBar.preferredSize.height - MediaQuery.of(context).padding.top)* 0.3, child: Chart(user_transactions)),
            Container(height: (MediaQuery.of(context).size.height  - appBar.preferredSize.height - MediaQuery.of(context).padding.top)* 0.7,child: TransactionList(user_transactions,deleteTx)),
          ]),
        ));
  }
}
