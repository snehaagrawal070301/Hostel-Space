import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';
import 'package:hostel_space/views/Facilities/HostelerHomepageFunctionns/HostelerHomePage.dart';

class OtpVerificationSignIn extends StatefulWidget {
  final String mobileNo, roll, name,roomNo;

  OtpVerificationSignIn(this.mobileNo, this.roll, this.name , this.roomNo);

  @override
  _OtpVerificationSignInState createState() => _OtpVerificationSignInState();
}

class _OtpVerificationSignInState extends State<OtpVerificationSignIn> {
  TextEditingController otp = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  QuerySnapshot snapshot;

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: _verificationCode,
        smsCode: otp.text,
      );

      // ignore: unused_local_variable
      final FirebaseUser user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HostelerHomePage(widget.mobileNo, widget.roll, widget.name, widget.roomNo)),
      );
      print(widget.roll);
      otp.clear();
      print("Succesfully  sign in");
      print(widget.roll);
    } catch (e) {
      print("Failed to sign in");
    }
  }

  String _verificationCode;

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.mobileNo,
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          print(e.message);
        },
        codeSent: (verficationID, [resendToken]) async {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Verification"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        //padding: EdgeInsets.symmetric(vertical: 40),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verify ${widget.mobileNo}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: otp,
                    validator: (value) {
                      return value.isEmpty ? "Please Enter Otp." : null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Otp .",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    signInWithPhoneNumber();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Text(
                        "Verify",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
