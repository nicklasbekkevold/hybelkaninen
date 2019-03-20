import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HouseholdPage extends StatefulWidget {
  @override
  _HouseholdPageState createState() => _HouseholdPageState();
}

class _HouseholdPageState extends State<HouseholdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My households"),
        ),
      ), 
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          const CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text("K"),
          ),
          const CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text("G"),
          ),
          const CircleAvatar(
            backgroundColor: Colors.amber,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}