import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/person_tile.dart';

class DustBunnies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      height: 200.0,
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Dust bunnies: ', style: Theme.of(context).textTheme.body1,)
            ),
            Divider(),
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) { 
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 135.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
                  );
                }
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return PersonTile(context, document['name'], document['points']);
  }

}

/*
return StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Text('Loading ...');
        return ListView.builder(
          itemExtent: 80.0,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
        );
      }
);
*/

  /*
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
          leading: Text('1st'),
          title: Text(document['name'], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black), ),
          trailing: Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 50.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(border: Border.all(width: 4.0, color: Colors.redAccent, ), ), 
            child: Text(document['points'].toString(), style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black), ),
          )
    );
  } 
  */