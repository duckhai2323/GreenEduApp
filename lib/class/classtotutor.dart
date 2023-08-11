import 'package:cloud_firestore/cloud_firestore.dart';

class ClassToTutor {
  final String? classid;
  final String? address;
  final String? grade;
  final String? freetime;
  final String? member;
  final String? money;
  final String? onweek;
  final String? point;
  final String? require;
  final String? subject;
  final String? userid;
  final Timestamp? timestamp;
  final String? formality;
  final String? capacity;
  final String? sex;
  final String demand;

  ClassToTutor(
      this.classid,
      this.address,
      this.grade,
      this.freetime,
      this.member,
      this.money,
      this.onweek,
      this.point,
      this.require,
      this.subject,
      this.userid,
      this.timestamp,
      this.formality,
      this.capacity,
      this.sex,
      this.demand);

  factory ClassToTutor.fromFirebase(DocumentSnapshot<Map<String,dynamic>> snapshot, SnapshotOptions? option){
    final data = snapshot.data();
    return ClassToTutor(
      data?['classid']??"",
      data?['address']??"",
      data?['grade']??"",
      data?['freetime']??"",
      data?['member']??"",
      data?['money']??"",
      data?['onweek']??"",
      data?['point']??"",
      data?['require']??"",
      data?['subject']??"",
      data?['userid']??"",
      data?['timestamp']??"",
      data?['formality']??"",
      data?['capacity']??"",
      data?['sex']??"",
      data?['demand']??"",
    );
  }

  Map<String,dynamic> toFirebase(){
    return {
      "classid":classid??"",
      "address":address??"",
      "grade":grade??"",
      "freetime":freetime??"",
      "member":member??"",
      "money":money??"",
      "onweek":onweek??"",
      "point":point??"",
      "require":require??"",
      "subject":subject??"",
      "userid":userid??"",
      "timestamp":timestamp??"",
      "formality":formality??"",
      "capacity":capacity??"",
      "sex":sex??"",
      "demand":demand??"",
    };
  }
}