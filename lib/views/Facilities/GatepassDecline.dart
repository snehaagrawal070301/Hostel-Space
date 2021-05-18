import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
class GatePassDecline extends StatefulWidget {
  @override
  _GatePassDeclineState createState() => _GatePassDeclineState();
}

class _GatePassDeclineState extends State<GatePassDecline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child: Container(child:Text("Gatepass Request has been declined by Caretaker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)))));
  }
}
