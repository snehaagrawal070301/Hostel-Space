import 'package:flutter/material.dart';
import 'package:hostel_space/views/signuplogin/OtpHostelerSignUp.dart';
import 'package:hostel_space/views/signuplogin/HostelerSignIn.dart';

class MobileVerification extends StatefulWidget {
  final String roll, name;

  MobileVerification(this.roll, this.name);

  @override
  State<StatefulWidget> createState() {
    return MobileVerificationState();
  }
}

class MobileVerificationState extends State<MobileVerification> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Student Sign In"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 05.0),
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
                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                /*   Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  }),
                  child: Container(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 14.0, color: Colors.black87),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),*/
                SizedBox(
                  height: 35.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      String mobile = '+91' + mobileNo.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpVerificationSignUp(
                                mobile, widget.roll, widget.name)),
                      );
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(30.0)),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Verify",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Already Registered? ",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HostelerSignIn()),
                        );
                      }),
                      child: Container(
                        child: Text(
                          "Sign In",
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
