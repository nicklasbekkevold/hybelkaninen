import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/task_tile.dart';

class Tasks extends StatelessWidget {

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(     
      child: Dismissible(
        key: Key(document.documentID),
        onDismissed: (direction) {
          Firestore.instance.collection('tasks').document(document.documentID).updateData({'repeats': false});
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("${document['title']} completed"),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () => Firestore.instance.collection('tasks').document(document.documentID).updateData({'repeats': true}),
            ),
            )
          );
        },
        child: TaskTile(context, document['points'], document['title']),
        background: Container(
          padding: EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          child: Icon(Icons.done, color: Colors.white, size: 30.0,), 
          color: Colors.green),
        secondaryBackground: Container(
          padding: EdgeInsets.only(right: 15.0),
          alignment: Alignment.centerRight,
          child: Icon(Icons.edit, color: Colors.white, size: 30.0,), 
            color: Colors.orange),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("TODOs"),
        Card(
          shape: RoundedRectangleBorder(),
          margin: EdgeInsets.all(0.0),
          child: StreamBuilder(
            stream: Firestore.instance.collection('tasks').where('repeats', isEqualTo: true).limit(3).snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) { 
                return LinearProgressIndicator();
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
        ),
        Center(
          child: FlatButton(
            child: Text('SHOW MORE'),
            textTheme: ButtonTextTheme.accent,
            onPressed: () => print('Pressed'),
          ),
        ),
      ],
    );
  }

}