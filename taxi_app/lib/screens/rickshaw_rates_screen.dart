import 'package:flutter/material.dart';
import 'package:taxi_app/models/app_drawer.dart';

class RickshawRatesScreen extends StatelessWidget {

  static const routeName = '/rickshaw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rickshaw Rates'),),
      body: SingleChildScrollView(
        child: Table(
          children: [
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).accentColor,
                  child: TableCell(
                    child: Center(child: Text('Kms', style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold  
                    ),)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).accentColor,
                  child: TableCell(
                    child: Center(child: Text('Day Fare', style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).accentColor,
                  child: TableCell(
                    child: Center(child: Text('Night Fare', style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('1.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('18', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('23', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('1.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('19', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('24', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('1.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('21', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('26', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('1.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('22', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('27', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('1.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('23', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('29', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('24', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('30', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('26', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('32', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('27', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('33', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('28', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('35', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('29', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('37', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('30', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('38', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('32', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('40', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('33', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('41', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('34', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('43', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('2.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('35', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('44', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('37', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('46', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('38', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('47', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('39', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('49', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('40', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('50', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('41', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('52', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('43', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('53', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('44', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('55', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('45', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('56', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('46', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('58', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('3.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('48', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('59', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('49', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('61', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('50', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('62', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('51', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('64', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('52', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('65', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('54', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('67', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('55', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('69', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('56', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('70', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('57', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('72', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('58', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('73', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('4.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('60', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('75', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('61', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('76', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('62', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('78', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('63', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('79', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('65', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('81', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('66', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('82', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('67', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('84', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('68', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('85', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('69', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('87', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('71', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('88', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('5.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('72', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('90', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('73', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('91', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('74', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('93', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('76', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('94', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('77', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('96', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('78', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('97', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('79', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('99', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('80', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('100', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('82', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('102', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('83', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('104', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('6.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('84', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('105', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('85', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('107', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.1', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('86', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('108', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.2', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('88', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('110', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.3', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('89', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('111', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.4', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('90', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('113', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.5', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('91', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('114', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.6', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('93', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('116', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.7', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('94', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('117', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.8', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('95', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('119', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('7.9', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('96', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('120', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('8.0', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('97', style: TextStyle(fontSize: 16),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TableCell(
                    child: Center(child: Text('122', style: TextStyle(fontSize: 16),)),
                  ),
                ),
              ]),
          ]
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}