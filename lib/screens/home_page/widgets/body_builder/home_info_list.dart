import 'package:flutter/material.dart';
import 'dust_bunnies.dart';
import 'tasks.dart';

final Map<String, List<Widget>> content = {
  'headers': [DustBunnies.header, Tasks.header],
  'lists': [DustBunnies(), Tasks()],
  'footers': [
    Text(""), 
    Center(
      child: FlatButton(
        child: Text('SHOW MORE'),
        textTheme: ButtonTextTheme.accent,
        onPressed: () => print('Pressed'),
      ),
    )
  ],
};

Widget homeInfoList(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        content['headers'][index],
        content['lists'][index],
        content['footers'][index],
      ],
    ),
  );
}
