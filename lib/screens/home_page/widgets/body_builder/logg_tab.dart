import 'package:flutter/material.dart';
import '../components/logg_card.dart';

class LoggTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView(
        children: <Widget>[
          LoggCard(5, "did the dishes", 5, "NB"),
          LoggCard(18, "cleaned the kitchen", 8, "TR"),
          LoggCard(5, "took out the trash", 47, "HS"),
          LoggCard(5, "cleaned the bar", 50, "AB"),
          LoggCard(5, "did the dishes", 5, "NB"),
          LoggCard(18, "cleaned the kitchen", 8, "TR"),
          LoggCard(5, "took out the trash", 47, "HS"),
          LoggCard(5, "cleaned the bar", 50, "AB"),
        ],
      ),
    );
  }

}