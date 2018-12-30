import 'package:flutter/material.dart';

import '../../widgets/task_tile.dart';

class TodoTab extends StatefulWidget {

  @override
  _TodoTabState createState() => new _TodoTabState();

}

class _TodoTabState extends State<TodoTab> with TickerProviderStateMixin {

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

