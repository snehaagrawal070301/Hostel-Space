import 'package:flutter/material.dart';

class GatePass extends StatefulWidget {
  final String branch, date, name, permit, reason, roll, room, timein, timeout;

  GatePass(this.branch, this.date, this.name, this.permit, this.reason,
      this.roll, this.room, this.timein, this.timeout);

  @override
  _GatePassState createState() => _GatePassState();
}

class _GatePassState extends State<GatePass> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gate Pass"),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(color: Colors.purpleAccent),
            height: 650.0,
            width: 375.0,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "SAGAR INSTITUTE OF RESEARCH & TECHNOLOGY",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                "BHOPAL (M.P.)",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "NAME:     ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "HOSTEL:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "KALPANA CHAWLA",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "ROOM NO.:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.room,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),


              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "BRANCH:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.branch,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "DATE:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.date,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "REASON:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.reason,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "TIME OUT:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.timeout,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "TIME IN:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.timein,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
              Row(children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Caretaker:      ",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  widget.permit,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0,
                      color: Colors.black),
                ),
              ]),
              SizedBox(
                height: 30.0,
              ),
            ])),
      ),
    );
  }
}
