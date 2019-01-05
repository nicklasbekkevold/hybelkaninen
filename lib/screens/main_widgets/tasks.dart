import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/task_tile.dart';

class Tasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      height: 380.0,
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
            Expanded(
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
            ),
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
/*
class Tasks extends StatefulWidget {

  @override
  _TasksState createState() => new _TasksState();

}

class _TasksState extends State<Tasks> with TickerProviderStateMixin {

  final _items = ["Vaske rommet", "Gå ut med søpla", "Fikse ovnen", "Vaske gangen", "Kjøpe inn doruller", "Lage middag", "Jazz", "Bazz"];

  void _dismissCard(String task) {
    if (_items.contains(task)) {
      setState(() {
        _items.remove(task);
      });
    }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(

        itemCount: _items.length,
        itemBuilder: (context, index) {
            final task = _items[index];

            return new Container(
              decoration: new BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.2),
              ),     
              child: Dismissible(
                key: Key(task),
                onDismissed: (direction) {
                  _dismissCard(task);
                  Scaffold
                      .of(context)
                      .showSnackBar(SnackBar(content: Text("$task completed")));
                },
                child: TaskTile(20, '$task'),
                background: new Container(
                  padding: EdgeInsets.only(left: 15.0),
                  alignment: Alignment.centerLeft,
                  child: new Icon(Icons.done, color: Colors.white, size: 30.0,), 
                  color: Colors.green),
                secondaryBackground: new Container(
                  padding: EdgeInsets.only(right: 15.0),
                  alignment: Alignment.centerRight,
                  child: new Icon(Icons.edit, color: Colors.white, size: 30.0,), 
                    color: Colors.orange),
              ),
            );
          }
        ),
      );
    }

}
*/
