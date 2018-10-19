import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightGreenAccent,
        brightness: Brightness.dark
      ),
      home: const MyHomePage(title: 'Klæbuveien 34'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['name'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffdddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['points'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ]
      ),
      onTap: () {
        document.reference.updateData({
          'points': document['points'] + 1
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder( 
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...'); 
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
          );
        }
      ),
    );
  }
}
