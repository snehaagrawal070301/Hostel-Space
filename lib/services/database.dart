import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getcaretakerdetails() async {
    return await Firestore.instance.collection("user-caretaker").getDocuments();
  }

  getwardendetails() async {
    return await Firestore.instance.collection("user-warden").getDocuments();
  }

  sendStudentRequest(String enrollment, studentdetails) async {
    Firestore.instance
        .collection("student-request")
        .document(enrollment)
        .setData(studentdetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  addGatepassRequest(String enrollment, studentdetails) async {
    Firestore.instance
        .collection("gatepass-request")
        .document(enrollment)
        .setData(studentdetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserByEnrollment(String enrollment) async {
    return await Firestore.instance
        .collection("student-list")
        .where("roll", isEqualTo: enrollment)
        .getDocuments();
  }

  deleteStudentRequest(roll) async {
    return await Firestore.instance
        .collection("student-request")
        .document(roll)
        .delete();
  }

  acceptStudentRequest(roll, studentRequestDetail) async {
    return await Firestore.instance
        .collection("student-list")
        .document(roll)
        .setData(studentRequestDetail);
  }

  acceptGatepassRequest(roll, gatepassRequestDetail) async {
    return await Firestore.instance
        .collection("student-list")
        .document(roll)
        .collection("gatepass")
        .document()
        .setData(gatepassRequestDetail);
  }

  deleteGatepassRequest(roll) async {
    return await Firestore.instance
        .collection("gatepass-request")
        .document(roll)
        .delete();
  }

  acceptGatepassRequestforwarden(gatepassRequestDetail) async {
    return await Firestore.instance
        .collection("gatepass-record")
        .document()
        .setData(gatepassRequestDetail);
  }

  sendcomplaintDetailsWarden( complaintDetails) async {
    Firestore.instance
        .collection("user-warden")
        .document("Warden")
        .collection("student-complaint")
        .document()
        .setData(complaintDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  sendcomplaintDetailsCaretaker( complaintDetails) async {
    Firestore.instance
        .collection("user-caretaker")
        .document("Caretaker")
        .collection("student-complaint")
        .document()
        .setData(complaintDetails)
        .catchError((e) {
      print(e.toString());
    });
  }

  sendRoomShiftDetails(roomShiftDetails) async
  {
    Firestore.instance
        .collection("user-warden")
        .document("Warden")
        .collection("student-roomshift")
        .document()
        .setData(roomShiftDetails)
        .catchError((e) {
      print(e.toString());
    });
  }
}
