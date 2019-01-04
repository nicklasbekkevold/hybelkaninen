import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/task_tile.dart';

class Taskers extends StatefulWidget {

  @override
  _TasksState createState() => _TasksState();

}

class _TasksState extends State<Taskers> with TickerProviderStateMixin {

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

            return Container(
              decoration: BoxDecoration(
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
                child: TaskTile(context, 20, '$task'),
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
        ),
      );
    }

}