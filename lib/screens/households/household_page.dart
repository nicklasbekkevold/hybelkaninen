import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HouseholdPage extends StatefulWidget {

  final FirebaseUser user;

  HouseholdPage({
    Key key, 
    @required this.user
  }) : super(key: key);

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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: Firestore.instance.collection('users').document(widget.user.uid).snapshots(),
          builder: (context, snapshot) { 
            if(!snapshot.hasData) { 
              return LinearProgressIndicator();
            }
            return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: <Widget>[
                CircleAvatar(
                  child: Text("K"),
                  backgroundColor: Colors.amber,
                ),
                CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.amber,
                ),
                CircleAvatar(
                  child: Text("H"),
                  backgroundColor: Colors.amber,
                )
              ],
            ); 
          } 
        ),
      ),
    );
  }
}