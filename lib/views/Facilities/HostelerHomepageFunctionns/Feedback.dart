import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            Text("If you have any feedback, kindly reach us at:",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            SizedBox(height: 20.0,),
            GestureDetector(
                child:Text("hostelspaceofficialcustomercare@gmail.com",
              style: TextStyle(decoration: TextDecoration.underline,
                fontSize: 15, fontStyle: FontStyle.italic,color: Colors.blue[800]),),

            )
  ]
        ),
      ),
    );
  }
}
