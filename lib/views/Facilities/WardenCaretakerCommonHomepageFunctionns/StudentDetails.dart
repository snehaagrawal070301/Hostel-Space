import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  final String name, roll, mail, collage, branch, room, year, mobile, dob;

  StudentDetails(this.name, this.branch, this.collage, this.dob, this.roll,
      this.mail, this.mobile, this.year, this.room);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Name of a Student :  ",
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
                Text("Enrollment No :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.roll,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Mobile No. :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.mobile,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Collage :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.collage,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("E-mail :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.mail,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Year :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.year,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.0,
                left: 15.0,
              ),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text("Date of Birth :  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                Expanded(
                  child: Text(widget.dob,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0)),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 5.0),
              child: Row(children: <Widget>[
                Text("Room No :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.room,
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
