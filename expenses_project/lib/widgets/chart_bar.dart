import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double spendpercentage;

  ChartBar(this.label, this.amountSpend, this.spendpercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraints){
      return Column(
      children: [
        Container(height:  constraints.maxHeight * 0.1 ,child: FittedBox(child: Text(' \$ ${amountSpend.toStringAsFixed(0)}'))),
        SizedBox(
          height:  constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendpercentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(height: constraints.maxHeight * 0.1,child: FittedBox(child: Text(label)))
      ],
    );
    });
    
  }
}
