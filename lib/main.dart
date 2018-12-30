import 'package:flutter/material.dart';

import './screens/home_page.dart';
import './screens/add_task.dart';

void main() => runApp(Hybelkaninen());

class Hybelkaninen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hybelkaninen',
      color: Colors.purple,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent,
        
        textTheme: TextTheme(
          title: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
          headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder> {
        "HomePageTodo": (BuildContext context) => HomePage(),
        "AddTask": (BuildContext context) => AddTask(),
      }
    );
  }
}
