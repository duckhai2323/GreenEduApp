import 'package:cloud_firestore/cloud_firestore.dart';

class SubcribeClass {
  final String parentid;
  final String tutorid;
  final String classid;
  final String status;

  SubcribeClass(this.parentid, this.tutorid, this.classid,this.status);

  factory SubcribeClass.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return SubcribeClass(data?['parentid'],data?['tutorid'] , data?['classid'],data?['satus']);
  }

  Map<String,dynamic> toFirestore(){
    return {
      "parentid":parentid??"",
      "tutorid":tutorid??"",
      "classid":classid??"",
      "satus":status??"",
    };
  }
}