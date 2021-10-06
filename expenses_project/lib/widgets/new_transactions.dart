import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    addTx(title, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: submitData,
              )
            ],
          ),
        ));
  }
}
