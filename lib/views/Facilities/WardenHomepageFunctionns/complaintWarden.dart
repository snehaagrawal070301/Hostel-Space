import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/views/Facilities/WardenCaretakerCommonHomepageFunctionns/viewComplaint.dart';

class ComplaintWarden extends StatefulWidget {
  @override
  _ComplaintWardenState createState() => _ComplaintWardenState();
}

class _ComplaintWardenState extends State<ComplaintWarden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("STUDENT COMPLAINT")),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("user-warden")
                .document("Warden")
                .collection("student-complaint")
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
                          title: new Text('Complaint by ${document['name']} on ${document['date']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            print('${document['name']}');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ViewComplaint(
                                document['complaint'].toString(),
                              );
                            }));
                          },
                        ),
                      );
                    }).toList(),
                  );
              }
            }));
  }
}
