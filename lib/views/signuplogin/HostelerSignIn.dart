import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';
import 'package:hostel_space/views/signuplogin/OtpHostelerSignIn.dart';
import 'package:hostel_space/views/signuplogin/HostelerSignUp.dart';

class HostelerSignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HostelerSignInState();
  }
}

class HostelerSignInState extends State<HostelerSignIn> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController rollNo = TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();
  QuerySnapshot snapshot;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  verifyStudentsData() async {
    if (formKey.currentState.validate()) {
      String mobile = '+91' + mobileNo.text;

      try {
        await databaseMethods.getUserByEnrollment(rollNo.text).then((value) {
          setState(() {
            snapshot = value;
          });
        });
      } catch (e) {
        print(e.toString());
        scaffoldKey.currentState
        // ignore: deprecated_member_use
            .showSnackBar(new SnackBar(content: Text("Not Registered yet")));
      }
      if (snapshot.documents.length == 1 &&
          snapshot.documents[0].data['mobile'] == mobile &&
          snapshot.documents[0].data['roll'] == rollNo.text) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerificationSignIn(
                  mobile,
                  snapshot.documents[0].data['roll'],
                  snapshot.documents[0].data['name'],
              snapshot.documents[0].data['room'])),
        );
        mobileNo.clear();
        rollNo.clear();
        print("Data Verified");
      } else {
        scaffoldKey.currentState
        // ignore: deprecated_member_use
            .showSnackBar(new SnackBar(content: Text("Not Registered yet")));
        print("Data not Verified");
      }
      print(snapshot.documents[0].data['mobile']);
      print(snapshot.documents[0].data['roll']);
      print(mobile);
      print(rollNo.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.purple,
      ),
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(bottom: 05.0),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/welcome!.png"), fit: BoxFit.cover)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: mobileNo,
                      validator: (value) {
                        return value.isEmpty ? "Please Enter Mobile No." : null;
                      },
                      decoration: InputDecoration(
                          hintText: "Mobile No.",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: TextFormField(
                      controller: rollNo,
                      validator: (value) {
                        return value.isEmpty
                            ? "Please Enter Enrollment No."
                            : null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enrollment No.",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    )),

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
                          verifyStudentsData();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(30.0)),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              "Verify",
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Not Registered Yet? ",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HostelerSignUp()),
                        );
                      }),
                      child: Container(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14.0,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
