import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {

  @override
  AddTaskState createState() => AddTaskState();

}

class AddTaskState extends State<AddTask> {

  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void _showSnackbar (String value) {
    if(value.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ),);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.clear), onPressed: () {Navigator.of(context).pop("AddTask"); },),
        title: Text("Add a task"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
          
            Container(
              padding: EdgeInsets.all(40.0),
              child: Icon(Icons.loyalty, color: Colors.grey, size: 70.0,),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text("Task name:"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter taskname ... ",
                    ),
                    onSubmitted: (String str) {
                      setState(() {
                        _showSnackbar(str);
                      });
                    },
                  ),
                  Text("Points upon completion:"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Points ...",
                    ),
                    onSubmitted: (String str) {
                      setState(() {

                      });
                    },
                  ),
                  Text("Due date:"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                    ),
                    onSubmitted: (String str) {
                      setState(() {

                      });
                    },
                  ),
                  Text("Repeat:"),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Does not repeat",
                    ),
                    onSubmitted: (String str) {
                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
  
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.done),
        onPressed: () {Navigator.of(context).pop("AddTask"); },
      ), 
    );
  }

}