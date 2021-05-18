import 'package:flutter/material.dart';
import 'package:hostel_space/views/Facilities/CaretakerHomepageFunctionns/ViewGatepassRequestCaretaker.dart';
import 'package:hostel_space/views/Facilities/CaretakerHomepageFunctionns/complaintCaretaker.dart';
import 'package:hostel_space/views/Facilities/StudentRequest.dart';
import 'package:hostel_space/views/Facilities/WardenCaretakerCommonHomepageFunctionns/StudentsList.dart';

class CaretakerHomepage extends StatefulWidget {
  final String name;

  CaretakerHomepage(this.name);

  @override
  _CaretakerHomepageState createState() => _CaretakerHomepageState();
}

class _CaretakerHomepageState extends State<CaretakerHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: SingleChildScrollView(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentList()));
                              },
                              child: Icon(
                                Icons.sensor_door_rounded,
                                size: 55.0,
                              ),
                            ),
                            Text(
                              "Student List",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            StudentRequest()));
                              },
                              child: Icon(
                                Icons.sensor_door_rounded,
                                size: 55.0,
                              ),
                            ),
                            Text(
                              "Student-Request",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GatepassRequest()));
                              },
                              child: Icon(
                                Icons.sensor_door_rounded,
                                size: 55.0,
                              ),
                            ),
                            Text(
                              "Gatepass-Request",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ComplaintCaretaker()));
                              },
                              child: Icon(
                                Icons.sensor_door_rounded,
                                size: 55.0,
                              ),
                            ),
                            Text(
                              "Student Complaint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
          )),
        ],
      ),
    );
  }
}
