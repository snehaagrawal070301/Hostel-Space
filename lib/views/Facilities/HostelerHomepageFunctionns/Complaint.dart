import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';
import 'package:intl/intl.dart';

class Complaint extends StatefulWidget {
  final String name, roll;

  Complaint(this.name, this.roll);

  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  TextEditingController room = TextEditingController();
  TextEditingController complaint = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String complaintType = 'Others';
  DatabaseMethods databaseMethods = DatabaseMethods();

  addComplaint() async {
    Map<String, String> complaintDetails = {
      "name": widget.name,
      "roll": widget.roll,
      "room": room.text,
      "complaint": complaint.text,
      "date": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    if (complaintType == "Others" ||
        complaintType == 'Regarding Hostel' ||
        complaintType == "Regarding Roommate") {
      try {
        await databaseMethods.sendcomplaintDetailsWarden(
             complaintDetails);
      } catch (e) {
        print(e.toString());
      }
    } else {
      try {
        await databaseMethods.sendcomplaintDetailsCaretaker(
             complaintDetails);
      } catch (e) {
        print(e.toString());
      }
    }
    scaffoldKey.currentState
        // ignore: deprecated_member_use
        .showSnackBar(new SnackBar(content: Text("Complaint Sent!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File a complaint")),
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, backgroundBlendMode: BlendMode.saturation

                /* borderRadius: BorderRadius.horizont()*/
                ),
            child: DropdownButton<String>(
              value: complaintType,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              onChanged: (String newValue) {
                setState(() {
                  complaintType = newValue;
                });
              },
              items: <String>[
                'Others',
                'Regarding Hostel',
                'Regarding Mess',
                'Regarding Room',
                'Regarding Roommate'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: complaint,
                minLines: 10,
                maxLines: 15,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Complaint',
                  filled: true,
                  fillColor: Color(0xFFDBEDFF),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: room,
            decoration: InputDecoration(
                hintText: "Room No.",
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              addComplaint();
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30.0)),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "SEND",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ),
    );
  }
}
