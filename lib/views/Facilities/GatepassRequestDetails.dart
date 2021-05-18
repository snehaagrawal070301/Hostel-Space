import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';

class GatepassRequestDetails extends StatefulWidget {
  final String enrollmentNo,
      name,
      roomNo,
      branch,
      date,
      reason,
      timeOut,
      timeIn,
      permit;

  GatepassRequestDetails(this.enrollmentNo, this.name, this.roomNo, this.branch,
      this.date, this.reason, this.timeOut, this.timeIn, this.permit);

  @override
  GatepassRequestDetailsState createState() => GatepassRequestDetailsState();
}

class GatepassRequestDetailsState extends State<GatepassRequestDetails> {
  DatabaseMethods databaseMethods = DatabaseMethods();

  deleteRequest() {
    databaseMethods.deleteGatepassRequest(widget.enrollmentNo);
    Map<String, String> gatepassDetails = {
      "roll": widget.enrollmentNo,
      "name": widget.name,
      "room": widget.roomNo,
      "branch": widget.branch,
      "date": widget.date,
      "reason": widget.reason,
      "timeOut": widget.timeOut,
      "timeIn": widget.timeIn,
      "permit": widget.permit,
      "accept": "no"
    };
    databaseMethods.acceptGatepassRequest(widget.enrollmentNo, gatepassDetails);
    Navigator.pop(context);
  }

  acceptRequest() {
    databaseMethods.deleteGatepassRequest(widget.enrollmentNo);

    Map<String, String> gatepassDetails = {
      "roll": widget.enrollmentNo,
      "name": widget.name,
      "room": widget.roomNo,
      "branch": widget.branch,
      "date": widget.date,
      "reason": widget.reason,
      "timeOut": widget.timeOut,
      "timeIn": widget.timeIn,
      "permit": widget.permit,
      "accept": "yes"
    };

    databaseMethods.acceptGatepassRequest(widget.enrollmentNo, gatepassDetails);
    databaseMethods.acceptGatepassRequestforwarden(gatepassDetails);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gatepass Info"),
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
                Text(" Date:  ",
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
                Text("Time Out  : ",
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
                Text("Permitted By  :  ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text(widget.permit,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)),
              ]),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      deleteRequest();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Delete",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      acceptRequest();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.deepPurple,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        "Accept",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
