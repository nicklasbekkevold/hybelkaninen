import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/task_tile.dart';

class Taskers extends StatefulWidget {

  @override
  _TasksState createState() => _TasksState();

}

class _TasksState extends State<Taskers> with TickerProviderStateMixin {

  void _dismissCard(String task) {
    setState(() {
      Firestore.instance.collection('tasks').document(task).updateData({'repeats': false});
    });
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(     
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: Firestore.instance.collection('tasks').where('repeats', isEqualTo: true).snapshots(),
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
    );
  }

}