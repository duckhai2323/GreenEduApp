
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenedu/user/user.dart';

class Tutor extends User {
  final String? uniName;
  final String? major;
  final String? level;
  final String? leap;

  Tutor(
      String id,
      String image,
      String fullName,
      String birthday,
      String email,
      String password,
      String numberPhone,
      String role,
      {this.uniName,
      this.major,
      this.level,
      this.leap,}):super(id,image,fullName,birthday,email,password,numberPhone,role);

  factory Tutor.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return Tutor(
      data?['id']??"",
      data?['image']??"",
      data?['fullName']??"",
      data?['birthday']??"",
      data?['email']??"",
      data?['password']??"",
      data?['numberPhone']??"",
      data?['role']??"",
      uniName: data?['uniName'],
      major: data?['major'],
      level: data?['level'],
      leap: data?['leap'],
    );
  }

  Map<String,dynamic> toFirestore(){
    return {
      "id":super.id??"",
      "image":super.image??"",
      "fullName":super.fullName??"",
      "birthday":super.birthday??"",
      "email":super.email??"",
      "password":super.password??"",
      "numberPhone":super.numberPhone??"",
      "role":super.role??"",
      "uniName":uniName??"",
      "major":major??"",
      "level":level??"",
      "leap":leap??"",
    };
  }
}