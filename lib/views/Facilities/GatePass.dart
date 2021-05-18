import 'package:flutter/material.dart';

class GatePassData extends StatefulWidget {
  @override
  _GatePassDataState createState() => _GatePassDataState();
}

class _GatePassDataState extends State<GatePassData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apply For GatePass")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Reason"),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Timing"),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30.0)),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Request",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
