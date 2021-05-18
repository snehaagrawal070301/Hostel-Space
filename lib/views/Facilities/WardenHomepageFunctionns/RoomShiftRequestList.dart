import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/views/Facilities/WardenHomepageFunctionns/ViewRoomShiftRequest.dart';
class RoomShiftRequestList extends StatefulWidget {
  @override
  _RoomShiftRequestListState createState() => _RoomShiftRequestListState();
}

class _RoomShiftRequestListState extends State<RoomShiftRequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ROOMSHIFT REQUESTS")),
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("user-warden")
                .document("Warden")
                .collection("student-roomshift")
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
                          title: new Text('Roomshift Request by ${document['name']} on ${document['date']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ViewRoomShiftRequest(
                                    document['name'].toString(),
                                    document['roll'].toString(),
                                    document['roomNo'].toString(),
                                    document['newRoomNo'].toString(),
                                    document['reason'].toString(),
                                    document['roomType'].toString(),



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