import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenedu/user/user.dart';
class Parent extends User{

  Parent(
      String id,
      String image,
      String fullName,
      String birthday,
      String email,
      String password,
      String numberPhone,
      String role,
      ):super(id,image,fullName,birthday,email,password,numberPhone,role);

  factory Parent.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return Parent(
      data?['id']??"",
      data?['image']??"",
      data?['fullName']??"",
      data?['birthday']??"",
      data?['email']??"",
      data?['password']??"",
      data?['numberPhone']??"",
      data?['role']??"",
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
    };
  }
}