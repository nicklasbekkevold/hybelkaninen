import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/task_tile.dart';
import 'stateful_tasks.dart';

class Tasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      //height: 380.0,
      child: Card(
        margin: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text('TODOs: ', style: Theme.of(context).textTheme.body1,)
            ),
            Divider(height: 0.0,),
            Taskers(),
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
            Divider(height: 0.0,),
            Center(
              child: FlatButton(
                child: Text('SHOW MORE'),
                textTheme: ButtonTextTheme.accent,
                onPressed: () => print('Pressed'),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return TaskTile(context, document['points'], document['title']);
  }

}
