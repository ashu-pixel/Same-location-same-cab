import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/app_drawer.dart';
import '../widgets/ui_Container.dart';

class BillSPlitterScreen extends StatelessWidget {

  static const routeName = '/billSpltter';
  @override
  Widget build(BuildContext context) {

    final _amountController = TextEditingController();
    final _noController = TextEditingController();
    double amount;
    Size size = MediaQuery.of(context).size;

    double calculate(){
      final totalAmount = _amountController.text as double;
      final people = _noController.text as double;

      amount = totalAmount/people;
      return amount;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Bill Splitter'),),
        body: Column(
          children: <Widget>[
          SizedBox(height: size.height*0.05,),
          UiContainer(
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on, color: Theme.of(context).primaryColor,),
                hintText: 'Enter Amount'
              ),
            ),
            Theme.of(context).accentColor,
            size.width*0.95,
          ),
          UiContainer(
            TextField(
              controller: _noController,
              decoration: InputDecoration(
                icon: Icon(Icons.people, color: Theme.of(context).primaryColor,),
                hintText: 'No of People'
              ),
            ),
            Theme.of(context).accentColor,
            size.width*0.95,
          ),
          FlatButton(
            child: Text('Calculate'),
            onPressed: () {
              String total = calculate().toString();
            },
          )
        ],),
      drawer: AppDrawer(),
    );
  }
}