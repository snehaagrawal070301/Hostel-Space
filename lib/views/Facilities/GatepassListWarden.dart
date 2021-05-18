import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/views/Facilities/GatepassDetailsWarden.dart';

class GatepassListWarden extends StatefulWidget {
  @override
  _GatepassListWardenState createState() => _GatepassListWardenState();
}

class _GatepassListWardenState extends State<GatepassListWarden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gate pass List"),
          backgroundColor: Colors.purple,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                Firestore.instance.collection('gatepass-record').snapshots(),
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
                          title: new Text('${document['roll']}'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 25.0,
                          ),
                          contentPadding: EdgeInsets.all(20.0),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return GatepassDetailsWarden(
                                document['roll'].toString(),
                                document['name'].toString(),
                                document['room'].toString(),
                                document['branch'].toString(),
                                document['date'].toString(),
                                document['reason'].toString(),
                                document['timeOut'].toString(),
                                document['timeIn'].toString(),
                                document['permit'].toString(),
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
