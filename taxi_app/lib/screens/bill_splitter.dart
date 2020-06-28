import 'package:flutter/material.dart';
import '../models/app_drawer.dart';
import '../widgets/ui_Container.dart';

class BillSPlitterScreen extends StatelessWidget {

  static const routeName = '/billSpltter';
  @override
  Widget build(BuildContext context) {

    final _amountController = TextEditingController();
    final _noController = TextEditingController();
    var amount;
    Size size = MediaQuery.of(context).size;
    final peopleFocus = FocusNode();

    dynamic calculate(){
      final totalAmount = _amountController.text;
      final people = _noController.text;

      amount = double.parse(totalAmount)/double.parse(people);
      print(totalAmount);
      print(people);
      return amount;
    }
    calculateAmount(){
      String total = calculate().toString();
      print(total);
      showModalBottomSheet(context: context, builder: (ctx){
      return UiContainer(
        Column(children: <Widget>[
          Container(
            child: Text(
              'Amount to be paid by each person :',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text(
              total,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25 
              ),
            ),
          )],
        ),
      Theme.of(context).accentColor,
      size.width*0.8
      );
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Bill Splitter'),),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
            SizedBox(height: size.height*0.04,),
            UiContainer(
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on, color: Theme.of(context).primaryColor,),
                  hintText: 'Enter Amount'
                ),
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(peopleFocus);
                },
              ),
              Theme.of(context).accentColor,
              size.width*0.9,
            ),
            UiContainer(
              TextField(
                controller: _noController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.people, color: Theme.of(context).primaryColor,),
                  hintText: 'No of People'
                ),
                focusNode: peopleFocus,
                onSubmitted: (_){
                  calculateAmount();
                },
              ),
              Theme.of(context).accentColor,
              size.width*0.9,
            ),
            UiContainer(
              FlatButton(
                child: Text('Calculate', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  calculateAmount();
                }
              ), 
              Theme.of(context).primaryColor,
              size.width*0.4
              )
          ],),
        ),
      drawer: AppDrawer(),
    );
  }
}