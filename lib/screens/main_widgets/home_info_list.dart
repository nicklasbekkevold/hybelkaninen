import 'package:flutter/material.dart';
import 'dust_bunnies.dart';
import 'stateful_tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/person_tile.dart';

final List<Container> infoLists = [
  Container(
    padding: EdgeInsets.symmetric(vertical: 20.0),
    height: 130.0,
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
        Text('Header for list $index', style: Theme.of(context).textTheme.body2,),
        infoLists[index],
        Center(
          child: FlatButton(
            child: Text('SHOW MORE'),
            textTheme: ButtonTextTheme.accent,
            onPressed: () => print('Pressed'),
          ),
        ),
          /* Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection('tasks').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) { 
                  return CircularProgressIndicator();
                } 
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(height: 1.0, color: Colors.grey,),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
                );
              }
            ),
          ), */

        /* 
        Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) { 
                return LinearProgressIndicator();
              }
              return ListView.builder(
                itemCount: 3,//snapshot.data.documents.length,
                shrinkWrap: true, // todo comment this out and check the result
                physics: ClampingScrollPhysics(), // todo comment this out and check the result
                itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])                    
              );
            }
          ),
        ),
        */
      ],
    ),
  );
}
/*
Map<int, Widget> items = {
  0: Column(
      children: <Widget>[
        Text(
          'Header for list $index',
          style: Theme.of(context).textTheme.body2,
        ),
        Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) { 
                return LinearProgressIndicator();
              }
              return ListView.builder(
                itemCount: 2,//snapshot.data.documents.length,
                shrinkWrap: true, // todo comment this out and check the result
                physics: ClampingScrollPhysics(), // todo comment this out and check the result
                itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])                    
              );
            }
          ),
        ),
      ],
    ),
  1: Column(
      children: <Widget>[
        Text(
          'Header for list $index',
          style: Theme.of(context).textTheme.body2,
        ),
        Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) { 
                return LinearProgressIndicator();
              }
              return ListView.builder(
                itemCount: 2,//snapshot.data.documents.length,
                shrinkWrap: true, // todo comment this out and check the result
                physics: ClampingScrollPhysics(), // todo comment this out and check the result
                itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])                    
              );
            }
          ),
        ),
      ],
    ),
  2: Column(
      children: <Widget>[
        Text(
          'Header for list $index',
          style: Theme.of(context).textTheme.body2,
        ),
        Container(
          color: Colors.white,
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').orderBy('points').snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) { 
                return LinearProgressIndicator();
              }
              return ListView.builder(
                itemCount: 2,//snapshot.data.documents.length,
                shrinkWrap: true, // todo comment this out and check the result
                physics: ClampingScrollPhysics(), // todo comment this out and check the result
                itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])                    
              );
            }
          ),
        ),
      ],
    ),
};

Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return PersonTile(context, document['name'], document['points']);
}
*/