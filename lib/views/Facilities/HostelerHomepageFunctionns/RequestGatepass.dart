import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';

class RequestGatepass extends StatefulWidget {
  @override
  RequestGatepassState createState() => RequestGatepassState();
}

class RequestGatepassState extends State<RequestGatepass> {
  final formKey = GlobalKey<FormState>();

  TextEditingController room = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController hostel = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController timeOut = TextEditingController();
  TextEditingController timeIn = TextEditingController();
  TextEditingController permit = TextEditingController();
  TextEditingController enrollmentNo = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController name = TextEditingController();

  /* bool _checkbox = false;
  List<String> _list1 = [];

  List<String> _listString1 = [
    "KC",
    "AB",
    "MT",
  ];

  // var singleline;
  List<bool> selected = [];*/

  DatabaseMethods databaseMethods = DatabaseMethods();

  sendGatepassDetails() async {
    Map<String, String> studentDetails = {
      "roll": enrollmentNo.text,
      "name": name.text,
      "room": room.text,
      "branch": branch.text,
      "date": date.text,
      "reason": reason.text,
      "timeOut": timeOut.text,
      "timeIn": timeIn.text,
      "permit": permit.text,
    };

    try {
      await databaseMethods.addGatepassRequest(
          enrollmentNo.text, studentDetails);
    } catch (e) {
      print(e.toString());
    }
    scaffoldKey.currentState
        // ignore: deprecated_member_use
        .showSnackBar(new SnackBar(content: Text("GatePass Request sent")));
  }

  /* @override
  void initState() {
    setState(() {
      for (int i = 0; i < _listString1.length; i++) {
        _list1.insert(0, '${_listString1[i]}');
        selected.insert(0, false);
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request Gate Pass"),
          backgroundColor: Colors.purple,
        ),
        key: scaffoldKey,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: ListView(children: <Widget>[
              TextFormField(
                controller: enrollmentNo,
                decoration: const InputDecoration(
                  labelText: 'ENROLLMENT NO.',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: name,
                validator: (value) => value.isEmpty
                    ? 'Enter Your Name'
                    : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                            .hasMatch(value)
                        ? 'Enter a Valid Name'
                        : value.length < 3
                            ? 'Name must contain more than 3 characters'
                            : null,
                decoration: const InputDecoration(
                  labelText: 'NAME',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              /*_list1.isNotEmpty
                  ? Wrap(
                children: _list1.map(
                      (item) {
                    var index = _list1.indexOf(item);
                    return IntrinsicWidth(
                      child: Container(
                        width: 120,
                        height: 40,
                        child: Card(
                          child: InkWell(
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: selected[index],
                                      onChanged: (bool val) {
                                        setState(() {
                                          selected[index] = val;
                                        });
                                      }),
                                  Expanded(child: Text(item)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              )
                  : Container(),*/
              TextFormField(
                controller: room,
                decoration: const InputDecoration(
                  labelText: 'ROOM NO.',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: branch,
                decoration: const InputDecoration(
                  labelText: 'BRANCH',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: date,
                decoration: const InputDecoration(
                  labelText: 'DATE',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: reason,
                decoration: const InputDecoration(
                  labelText: 'REASON',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: timeOut,
                decoration: const InputDecoration(
                  labelText: 'TIME OUT',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: timeIn,
                decoration: const InputDecoration(
                  labelText: 'TIME IN',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: permit,
                decoration: const InputDecoration(
                  labelText: 'Warden Name',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  sendGatepassDetails();
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30.0)),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "REQUEST",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ])));
  }
}
/*DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);*/
