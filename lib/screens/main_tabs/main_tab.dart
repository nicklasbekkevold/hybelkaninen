import 'package:flutter/material.dart';
import '../../widgets/person_tile.dart';
import '../../widgets/logg_card.dart';

class MainTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return(Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
                children: <Widget>[
                  Container(
                    child: new Text("Top scores:", style: new TextStyle(fontStyle: FontStyle.italic,),),
                    padding: EdgeInsets.only(top: 10.0, left: 16.0),
                  ),
                  Divider(),
                  PersonTile(context, "Halvard", 5),
                  Divider(),
                  PersonTile(context, "Nicklas", 10),
                  Divider(),  
                  PersonTile(context, "Halvard", 5),
                  Divider(),
                  PersonTile(context, "Nicklas", 10),
                  Divider(),
                  PersonTile(context, "Halvard", 5),
                  Divider(),
                  PersonTile(context, "Nicklas", 10),
                  Divider(),
                  PersonTile(context, "Halvard", 5),
                  Divider(),
                  PersonTile(context, "Nicklas", 10),
                  Divider(),
                  Container(
                    child: new Text("Recent activity:", style: new TextStyle(fontStyle: FontStyle.italic,),),
                    padding: EdgeInsets.only(bottom: 10.0, left: 16.0),
                  ),
                  LoggCard(5, "supplied the bar", 8, "HS"),
                  LoggCard(10, "did the dishes", 20, "NB"),
                  LoggCard(5, "supplied the bar", 8, "HS"),
                  LoggCard(10, "did the dishes", 20, "NB"),
                  LoggCard(5, "supplied the bar", 8, "HS"),
                  LoggCard(10, "did the dishes", 20, "NB"),
                  LoggCard(5, "supplied the bar", 8, "HS"),
                  LoggCard(10, "did the dishes", 20, "NB"),
                ],
            ),
          ),
        ],
      ),
    ));
  }

}

/*
return StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Text('Loading ...');
        return ListView.builder(
          itemExtent: 80.0,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documnets[index]),
        );
      }
);
*/

  /*
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
          leading: Text('1st'),
          title: Text(document['name'], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black), ),
          trailing: Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 50.0,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(border: Border.all(width: 4.0, color: Colors.redAccent, ), ), 
            child: Text(document['points'].toString(), style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black), ),
          )
    );
  } 
  */