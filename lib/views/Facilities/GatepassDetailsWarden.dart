import 'package:flutter/material.dart';

class GatepassDetailsWarden extends StatefulWidget {
  final String enrollmentNo,
      name,
      roomNo,
      branch,
      date,
      reason,
      timeOut,
      timeIn,
      permit;

  GatepassDetailsWarden(this.enrollmentNo, this.name, this.roomNo, this.branch,
      this.date, this.reason, this.timeOut, this.timeIn, this.permit);

  @override
  _GatepassDetailsWardenState createState() => _GatepassDetailsWardenState();
}

class _GatepassDetailsWardenState extends State<GatepassDetailsWarden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Gatepass Details"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Enrollment No. :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.enrollmentNo,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Name :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.name,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Room No. :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.roomNo,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Branch :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.branch,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Date :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.date,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Reason :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.reason,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Time Out:  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.timeOut,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Time In :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.timeIn,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Permitted By :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.permit,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
