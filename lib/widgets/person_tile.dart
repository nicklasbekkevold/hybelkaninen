import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  
  final String _name;
  final int _points;

  PersonTile(BuildContext context, this._name, this._points);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text(_name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black), ),
          trailing: Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 50.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(border: Border.all(width: 4.0, color: Theme.of(context).accentColor, ), ), 
            child: Text(_points.toString(), style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black), ),
          ),
          
    );
  }

} 