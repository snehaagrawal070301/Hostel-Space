import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hostel_space/additional/icons.dart';
import 'package:hostel_space/views/signuplogin/CaretakerSignIn.dart';
import 'package:hostel_space/views/signuplogin/HostelerSignIn.dart';
import 'package:hostel_space/views/signuplogin/HostelerSignUp.dart';
import 'package:hostel_space/views/signuplogin/WardenSignIn.dart';
class SignInOption extends StatefulWidget {
  final AssetImage bImage;

  SignInOption(this.bImage);

  @override
  _SignInOptionState createState() => _SignInOptionState();
}

class _SignInOptionState extends State<SignInOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.bImage,
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Center(
        child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 2,
                  color: Colors.pink[200].withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text("Sign Up as a Hosteler",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HostelerSignUp();
                      }));
                    },
                    trailing:
                        Icon(MyFlutterApp.signupicon, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 2,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(
                      "Sign In as a Hosteler",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HostelerSignIn();
                      }));
                    },
                    trailing:
                        Icon(MyFlutterApp.signinicon, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  color: Colors.pink[200].withOpacity(0.6),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(
                      "Sign In as a Warden",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WardenSignIn();
                      }));
                    },
                    trailing: Icon(
                      MyFlutterApp.wardenicon,
                      color: Colors.black,

                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 2,
                  color: Colors.white.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    title: Text(
                      "Sign In as a Caretaker",
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CaretakerSignIn();
                      }));
                    },
                    trailing:
                        Icon(MyFlutterApp.caretakericon, color: Colors.black),
                  ),
                ),
              ],
            )),
      ),
    ));
  }
}
