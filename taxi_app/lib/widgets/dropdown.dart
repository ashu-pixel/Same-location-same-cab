import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  List<String> _getType = ['Taxi', 'Rickshaw'];
  List<DropdownMenuItem<String>> _dropdownItems;
  String _selectedType;

  @override
  void initState() {
    _dropdownItems = buildDropDownMenuItems(_getType);
    _selectedType = _dropdownItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List types){
    List<DropdownMenuItem<String>> items = List();
    for(String type in types){
      items.add(
        DropdownMenuItem(
          value: type, 
          child: Text(type, style: TextStyle(color: Theme.of(context).primaryColor),)
        )
      );
    } 
    return items;
  }

  onChangedMenu(String selectedType){
    setState(() {
      _selectedType = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Select A Mode', 
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        textAlign: TextAlign.left,
      ),
      //SizedBox(height: 10,),
      DropdownButton(
        value: _selectedType,
        items: _dropdownItems,
        onChanged: onChangedMenu,
      )
    ],);
  }
}