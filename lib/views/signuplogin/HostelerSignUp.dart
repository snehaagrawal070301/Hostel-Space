import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';
import 'package:hostel_space/views/signuplogin/MobileVerification.dart';

import 'HostelerSignIn.dart';

class HostelerSignUp extends StatefulWidget {
  @override
  HostelerSignUpState createState() => HostelerSignUpState();
}

class HostelerSignUpState extends State<HostelerSignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController enrollmentNo = TextEditingController();
  TextEditingController roomNo = TextEditingController();
  QuerySnapshot querySnapshot;

  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2022),
        initialDatePickerMode: DatePickerMode.year,
        context: context);
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  String collage = 'Select Your College';
  String branch = 'Select Your Branch';
  String year = 'Select Your Year';
  String hostel = 'Select Your Hostel';
  DatabaseMethods databaseMethods = DatabaseMethods();

  addStudentDetails() async {
    if (formKey.currentState.validate()) {
      await databaseMethods.getUserByEnrollment(enrollmentNo.text).then((val) {
        setState(() {
          querySnapshot = val;
        });
      });
      if (querySnapshot.documents.length == 0) {
        Map<String, String> studentDetails = {
          "name": name.text,
          "roll": enrollmentNo.text,
          "mobile": "+91" + mobileNo.text,
          "email": email.text,
          "room": roomNo.text,
          "dob": selectedDate.toString(),
          "collage": collage,
          "branch": branch,
          "year": year,
          "hostel": hostel
        };

        try {
          await databaseMethods.sendStudentRequest(
              enrollmentNo.text, studentDetails);
        } catch (e) {
          print(e.toString());
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MobileVerification(enrollmentNo.text, name.text);
        }));
      } else {
        print("Already Registered");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text("Create an Account!",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: "FredokaOne")),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Form(
              key: formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: name,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Full Name",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                            validator: (value) => value.isEmpty
                                ? 'Enter Your Name'
                                : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                                .hasMatch(value)
                                ? 'Enter a Valid Name'
                                : value.length < 3
                                ? 'Name must contain more than 3 characters'
                                : null,
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: mobileNo,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mobile Number",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: email,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "E-mail",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: Text(
                            selectedDate.toString(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: GestureDetector(
                              onTap: () {
                                selectDate(context);
                                print(selectedDate.toString());
                              },
                              child: Icon(Icons.calendar_today_sharp)),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: enrollmentNo,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enrollment Number",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: new DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: collage,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  collage = newValue;
                                });
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black54, fontSize: 16),
                              items: <String>[
                                'Select Your College',
                                'SIRT',
                                'SIRT-S',
                                'SIRT-E',
                                'SIRT-P'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: new DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: branch,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  branch = newValue;
                                });
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black54, fontSize: 16),
                              items: <String>[
                                'Select Your Branch',
                                'CSE',
                                'ME',
                                'CIVIL',
                                'EE',
                                'IT'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: new DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: year,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  year = newValue;
                                });
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black54, fontSize: 16),
                              items: <String>[
                                'Select Your Year',
                                'FIRST YEAR',
                                'SECOND YEAR',
                                'THIRD YEAR',
                                'FOURTH YEAR'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          title: new DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: hostel,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  hostel = newValue;
                                });
                              },
                              style: const TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black54, fontSize: 16),
                              items: <String>[
                                'Select Your Hostel',
                                'Kalpana Chawla ',
                                'Annie Besant',
                                'Mother Teresa'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 8.0,
                    ),
                    Card(
                        elevation: 2,
                        color: Colors.blueGrey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: roomNo,
                            style:
                            TextStyle(color: Colors.black, fontSize: 16.0),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Room Number",
                                hintStyle:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54 )),
                          ),
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              addStudentDetails();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(30.0)),
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  "Proceed",
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
                            "Already have an account?",
                            style:
                            TextStyle(fontSize: 14.0, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HostelerSignIn()),
                            );
                          }),
                          child: Container(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14.0,
                                  color: Colors.indigoAccent),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
