import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/person_tile.dart';

class DustBunnies extends StatelessWidget {

  static Text header = Text("Dust bunnies");

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        height: 115.0,
        child: StreamBuilder(
          stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) { 
              return LinearProgressIndicator();
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 115.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
            );
          }
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return PersonTile(context, document['name'], document['points']);
  }

}
