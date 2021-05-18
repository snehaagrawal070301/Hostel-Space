import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/additional/ForgotPassword.dart';
import 'package:hostel_space/services/database.dart';

import '../Facilities/CaretakerHomepageFunctionns/CaretakerHomepage.dart';

class CaretakerSignIn extends StatefulWidget {
  @override
  _CaretakerSignInState createState() => _CaretakerSignInState();
}

class _CaretakerSignInState extends State<CaretakerSignIn> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  QuerySnapshot querySnapshot;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  caretakerAuthentication() async {
    await databaseMethods.getcaretakerdetails().then((val) {
      setState(() {
        querySnapshot = val;
      });
    });
    if (querySnapshot.documents[0].data['email'] == email.text &&
        querySnapshot.documents[0].data['password'] == password.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CaretakerHomepage(querySnapshot.documents[0].data['name'])),
      );
      email.clear();
      password.clear();
    } else {
      scaffoldKey.currentState
      // ignore: deprecated_member_use
          .showSnackBar(new SnackBar(content: Text("Invalid")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Sign In"),
          backgroundColor: Colors.purple,
        ),
        key: scaffoldKey,
        body: Container(
            child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/welcome!.png"),
                        fit: BoxFit.cover)),
                child: Form(
                  key: formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                            validator: (value) =>
                            value.isEmpty ? 'Enter a Valid email ' : null,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: TextFormField(
                              controller: password,
                              validator: (value) {
                                return value.isEmpty
                                    ? "Please Enter Your Password"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()),
                                );
                              }),
                              child: Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.0,
                                      color: Colors.black),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  if (formKey.currentState.validate())
                                    caretakerAuthentication();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius:
                                      BorderRadius.circular(30.0)),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    "Sign In",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ]),
                ))));
  }
}
