import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Password"),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Save"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    "Reset Password",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password, again',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
