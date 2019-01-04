import 'package:flutter/material.dart';

class LoggCard extends StatelessWidget {
  
  final int _points;
  final String _task;
  final int _time;
  final String _user;

  LoggCard(this._points, this._task, this._time, this._user);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(0.0),
        child: ListTile(
          leading: Text("+${_points}p", style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.black), ),
          title: Text("$_task", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black), ),
          subtitle: Text("$_time minuttes ago", style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),),
          trailing: CircleAvatar(backgroundColor: Colors.redAccent,  child: Text("$_user"), maxRadius: 20.0,),
        ),
      ),
    );
  }

} 