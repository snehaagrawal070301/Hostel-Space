import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ViewComplaint extends StatefulWidget {
  final complaint;

  ViewComplaint(this.complaint);

  @override
  _ViewComplaintState createState() => _ViewComplaintState();
}

class _ViewComplaintState extends State<ViewComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Complaint")),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
          child: Text(

            widget.complaint,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),

          ),
        ));
  }
}
