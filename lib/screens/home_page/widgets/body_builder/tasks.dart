import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/task_tile.dart';

class Tasks extends StatefulWidget {

  static Text header = Text("TODOs");

  @override
  _TasksState createState() => _TasksState();

}

class _TasksState extends State<Tasks> with TickerProviderStateMixin {

  void _dismissCard(String task) {
    setState(() {
      Firestore.instance.collection('tasks').document(task).updateData({'repeats': false});
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      shape: RoundedRectangleBorder(),
      margin: EdgeInsets.all(0.0),
      child: Container(     
        child: Dismissible(
          key: Key(document.documentID),
          onDismissed: (direction) {
            _dismissCard(document.documentID);
            Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text("${document['title']} completed")));
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
    );
  }

}