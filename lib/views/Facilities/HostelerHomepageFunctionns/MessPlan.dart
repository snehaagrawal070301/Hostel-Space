import 'package:flutter/material.dart';

class MessPlan extends StatefulWidget {
  @override
  _MessPlanState createState() => _MessPlanState();
}

class _MessPlanState extends State<MessPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mess Plan")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        ),
      );
  }
}
