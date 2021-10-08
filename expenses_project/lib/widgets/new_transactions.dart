import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime date;

  void submitData() {
    if(amountController.text.isEmpty){
      return;
    }
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0 || date == null) {
      return;
    }
    widget.addTx(title, amount,date);
    Navigator.of(context).pop();
  }

  void datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
          if(value == null){
            return;
          }
          setState(() {
             date = value;
          });
         
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Card(
          elevation: 5,
          
          child: Container(
            
            padding : EdgeInsets.only(top: 10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom + 20),
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
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Text('Date: ${date == null ? 'No date chosen' : DateFormat.yMMMd().format(date)} ')),
                      FlatButton(
                          onPressed: datePicker,
                          child: Text('Choose date',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: submitData,
                )
              ],
            ),
          )),
    );
  }
}
