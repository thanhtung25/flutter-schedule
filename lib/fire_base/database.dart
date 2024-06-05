import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{


  Future addDetails(Map<String, dynamic> employeeInfoMap, String id) async{
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  // Future<Stream<QuerySnapshot>> getDetails()async{
  //   return await FirebaseFirestore.instance.collection("Employee").snapshots();
  // }
    Future<Stream<QuerySnapshot>> getDetails(String day)async{
    return await FirebaseFirestore.instance
    .collection("Employee")
    .where("Day", isEqualTo: day)
    .snapshots();
  }

  Future DeleteDetail(String id)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }

}