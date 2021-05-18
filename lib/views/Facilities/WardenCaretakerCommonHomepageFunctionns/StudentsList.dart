import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'StudentDetails.dart';

class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Student List"),
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('student-list').snapshots(),
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
                          title: new Text('${document['name']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return StudentDetails(
                                document['name'].toString(),
                                document['branch'].toString(),
                                document['collage'].toString(),
                                document['dob'].toString(),
                                document['roll'].toString(),
                                document['email'].toString(),
                                document['mobile'].toString(),
                                document['year'].toString(),
                                document['room'].toString(),
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
