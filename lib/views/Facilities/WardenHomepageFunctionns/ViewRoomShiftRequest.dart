import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ViewRoomShiftRequest extends StatefulWidget {
  final String reason, roll, roomNo, newRoomNo, name, type;

  ViewRoomShiftRequest(this.name, this.roll, this.roomNo, this.newRoomNo,
      this.reason, this.type);

  @override
  _ViewRoomShiftRequestState createState() => _ViewRoomShiftRequestState();
}

class _ViewRoomShiftRequestState extends State<ViewRoomShiftRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Roomshift Request by ${widget.name}")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
            children: [
              Container(
                child: Text(
                  "Name: ${widget.name}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "Enrollment Number: ${widget.roll}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "Current Room Number: ${widget.roomNo}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "New Room Number: ${widget.newRoomNo}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "Room Type: ${widget.type.toString()}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  "Reason for Room Change: ${widget.reason}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]));
  }
}
