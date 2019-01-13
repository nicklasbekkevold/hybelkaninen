import 'package:flutter/material.dart';
import 'widgets/body_builder/home_info_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

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
              onTap: () => print("Pressed: Sign out"),
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
          return homeInfoList(context, index);
        },
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: () {Navigator.of(context).pushNamed("AddTask"); },
      ), 
    );
  }

}