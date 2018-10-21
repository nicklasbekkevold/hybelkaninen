import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Drawer(
      child: new Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: new Container(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: new Text("Home"),
                    trailing: Icon(Icons.home),
                  ),
                  Divider(
                    height: 0.0,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: new Text("Chat"),
                    trailing: Icon(Icons.message),
                  ),
                  Divider(
                    height: 0.0,
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: new Text("Settlements"),
                    trailing: Icon(Icons.attach_money),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Divider(
                  height: 0.0,
                  color: Colors.grey,
                ),
                Container(
                  child: new ListTile(
                    title: new Text("About"),
                    trailing: Icon(Icons.info),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}