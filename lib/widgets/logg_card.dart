import 'package:flutter/material.dart';

class LoggCard extends StatelessWidget {
  
  int _points;
  String _task;
  int _time;
  String _user;

  LoggCard(this._points, this._task, this._time, this._user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Container(
        padding: EdgeInsets.all(0.0),
        child: ListTile(
          leading: new Text("+${_points}p", style: new TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black), ),
          title: Text("$_task", style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black), ),
          subtitle: Text("$_time minuttes ago", style: new TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),),
          trailing: new CircleAvatar(backgroundColor: Colors.redAccent,  child: new Text("$_user"), maxRadius: 20.0,),
        ),
      ),
    );
  }

} 