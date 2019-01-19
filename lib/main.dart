import 'package:flutter/material.dart';

import 'screens/auth/welcome_page.dart';
import 'screens/home_page/home_page.dart';
import 'screens/add_task/add_task.dart';

void main() => runApp(Hybelkaninen());

class Hybelkaninen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hybelkaninen',
      color: Colors.amber,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        accentColor: Colors.amberAccent[700],
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey[300],
        
        textTheme: TextTheme(
          title: TextStyle(fontSize: 22.0, ),
          headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.bold),
          body2: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
          button: TextStyle(fontSize: 14.0, color: Theme.of(context).accentColor),
        ),
      ),
      home: WelcomPage(),
      routes: <String, WidgetBuilder> {
        "HomePage": (BuildContext context) => HomePage(),
        "AddTask": (BuildContext context) => AddTask(),
      }
    );
  }
}
