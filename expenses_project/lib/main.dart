import 'package:flutter/material.dart';
import './widgets/user_tansactions.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.add_box,color: Colors.white,))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_box,color: Colors.white,),),
      body: 
      ListView(
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            UserTransactions(),
            
          ],
        ),
      
    );
  }
}
