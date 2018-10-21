import 'package:flutter/material.dart';

import './screens/home_page.dart';
import './screens/add_task.dart';

void main() => runApp(Hybelkaninen());

class Hybelkaninen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KLÆBU',
      theme: new ThemeData(
        brightness: Brightness.light
      ),
      home: HomePage(0),
      routes: <String, WidgetBuilder> {
        "HomePageTodo": (BuildContext context) => new HomePage(1),
        "AddTask": (BuildContext context) => new AddTask(),
      }
    );
  }
}
