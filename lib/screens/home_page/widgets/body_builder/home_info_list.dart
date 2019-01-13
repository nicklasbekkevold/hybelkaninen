import 'package:flutter/material.dart';
import 'dust_bunnies.dart';
import 'stateful_tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/person_tile.dart';

final List<Container> infoLists = [
  Container(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    height: 115.0,
    color: Colors.white,
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
  Container(
    color: Colors.white,
    child: Taskers(),
  ),
];

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return PersonTile(context, document['name'], document['points']);
}

Widget homeInfoList(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text('Header for list $index', style: Theme.of(context).textTheme.body2, ),
        infoLists[index],
        Center(
          child: FlatButton(
            child: Text('SHOW MORE'),
            textTheme: ButtonTextTheme.accent,
            onPressed: () => print('Pressed'),
          ),
        ),
      ],
    ),
  );
}
