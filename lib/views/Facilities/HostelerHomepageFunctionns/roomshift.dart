import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_space/services/database.dart';
import 'package:intl/intl.dart';

class RoomShift extends StatefulWidget {
  final String  roll, name, roomNo;

  RoomShift(this.roomNo,this.name,this.roll);
  @override
  State<StatefulWidget> createState() {
    return RoomShiftState();
  }
}

class RoomShiftState extends State<RoomShift> {
  TextEditingController newRoomNo = TextEditingController();
  TextEditingController reason = TextEditingController();
  String type = 'AC';
  String defaultRoomNo = "Not Specific Room No.";
  int _radioValue = 1;
  DatabaseMethods databaseMethods= DatabaseMethods();
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }
  addRoomshift()async{
    if(_radioValue==0){
      defaultRoomNo=newRoomNo.text;
    }
    Map<String,String> roomshiftDetails = {
        "newRoomNo": defaultRoomNo,
        "reason": reason.text,
        "roomType": type,
        "name": widget.name,
        "roll": widget.roll,
        "roomNo": widget.roomNo,
        "date": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    try{
      await databaseMethods.sendRoomShiftDetails(roomshiftDetails);
    }
    catch (e) {
      print(e.toString());
    }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Room Shift")),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Do you want any specific room?",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text(
                          'YES',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        Text(
                          'NO',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    if (_radioValue == 0)
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            controller: newRoomNo,
                            decoration: InputDecoration(
                                hintText: "New Room No.",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                )),
                          )),

                    SizedBox(height: 20.0),
                    ListTile(
                        title: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: type,
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        onChanged: (String newValue) {
                          setState(() {
                            type = newValue;
                          });
                        },
                        items: <String>['AC', 'NON-AC']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextField(
                        controller: reason,
                        minLines: 10,
                        maxLines: 30,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Reason',
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      addRoomshift();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30.0)),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Request",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  width: 25,
                )
              ]),
            ],
          ),
        ));
  }
}

