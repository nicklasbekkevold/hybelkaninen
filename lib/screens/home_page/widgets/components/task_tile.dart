import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  
  final int _points;
  final String _task;

  TaskTile(context, this._points, this._task);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 50.0,
            padding: EdgeInsets.all(2.0),
            child: Text("+${_points}p", style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black), ),
          ),
          title: Text("$_task",),
          subtitle: Text("weekly activity"),
          //trailing: new CircleAvatar(backgroundColor: Colors.redAccent,  child: new Text("$_user"), maxRadius: 20.0,),
    );
  }

} 