import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hostel_space/views/Facilities/GatePassDetailsStudent.dart';

import '../GatepassDecline.dart';

class ViewGatePassStudent extends StatefulWidget {
  final String roll;

  ViewGatePassStudent(this.roll);

  @override
  _ViewGatePassStudentState createState() => _ViewGatePassStudentState();
}

class _ViewGatePassStudentState extends State<ViewGatePassStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GatePass List"),
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('student-list')
                .document(widget.roll)
                .collection('gatepass')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return Card(
                        elevation: 8.0,
                        child: new ListTile(
                          title: new Text('Gatepass generated on ${document['date']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            if (document['accept'].toString() == 'yes') {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GatePass(
                                  document['branch'].toString(),
                                  document['date'].toString(),
                                  document['name'].toString(),
                                  document['permit'].toString(),
                                  document['reason'].toString(),
                                  document['roll'].toString(),
                                  document['room'].toString(),
                                  document['timeIn'].toString(),
                                  document['timeOut'].toString(),
                                );
                              }));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return GatePassDecline(

                                    );
                                  }));
                            }
                          },
                        ),
                      );
                    }).toList(),
                  );
              }
            }));
  }
}
