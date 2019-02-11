import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets/body_builder/dust_bunnies.dart';
import 'widgets/body_builder/tasks.dart';

class HomePage extends StatefulWidget {

  final String userId;

  HomePage({
    Key key, 
    @required this.userId
    }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {

  String selectedPopupRoute = "HomePage";
  final List<String> popupRoutes = <String>[
    "Edit Household", "Change Household", "Sign out",
  ];

  _showDialog(BuildContext context) {
    return () async {
      String selected = await showDialog<String>(
        context: context,
        child: SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit household'),
              onTap: () => print("Pressed: Edit household"),
              ),
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.swap_horiz),
                title: Text('Change household'),              
              onTap: () => print("Pressed: Change household"),              
              ),
            ),
            SimpleDialogOption(
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              },
              ),
            ),
          ],
        ),
      );
      if (selected != null) {
        setState(() {
          selectedPopupRoute = selected;
        });
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _showDialog(context),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('KLÆBU', style: Theme.of(context).textTheme.title,),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: [DustBunnies(userId: widget.userId), Tasks(userId: widget.userId)][index],
          );
        },
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: () {Navigator.of(context).pushNamed('AddTask'); },
      ), 
    );
  }

}
