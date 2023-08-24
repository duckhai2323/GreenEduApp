import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:greenedu/user/tutor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import '../../routes/names.dart';
import '../../user/parent.dart';

class SignupController extends GetxController{
  final firebaseAuth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  var obscureText1_ = true.obs;
  var obscureText2_ = true.obs;
  var value_ = 0.obs;
  var image = File('').obs;
  late var image_;
  late UploadTask uploadTask;
  var checkClickImage = false.obs;
  SignupController();

  Future<void> PickImage() async {
    try{
      image_ = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image_ == null) return;
      checkClickImage.value = true;
      image.value = File(image_.path);
    } catch(e){
      print(e);
    }
  }

  void ClickVisible1(){
    if(obscureText1_.value) {obscureText1_.value = false;}
    else {obscureText1_.value = true;}
  }
  void ClickVisible2(){
    if(obscureText2_.value) {obscureText2_.value = false;}
    else {obscureText2_.value = true;}
  }
  void ActionRadio(int index){
    value_.value = index;
  }

  Future<void> CreateUserWithEmailAndPassword(String email, String password) async {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){

    } catch(e){
      print(e);
    }
  }

  Future<void> PushDataUser(
      String fullName,
      String birthday,
      String email,
      String password,
      String numberPhone,) async {

    final path = 'files/${image_!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(image.value);
    final snapshot = await uploadTask!.whenComplete(() => {});
    final url = await snapshot.ref.getDownloadURL();
    late String role;
    if(value_.value == 0){

    }else if(value_.value == 1){
      role = "1";
    }else if(value_.value == 2){
      role = "2";
    } else {
      role = "3";
    }
    String documentId = firebase.collection("users").doc().id;
    if(role == '1'){
      var data  = Tutor(documentId,url, fullName, birthday, email, password, numberPhone, role);
      await firebase.collection('users').withConverter(
        fromFirestore: Tutor.fromFirestore,
        toFirestore: (Tutor userdata, options)=>userdata.toFirestore(),
      ).doc(documentId).set(data);
    }else if(role == '2'){
      var data  = Parent(documentId,url, fullName, birthday, email, password, numberPhone, role);
      await firebase.collection('users').withConverter(
        fromFirestore: Parent.fromFirestore,
        toFirestore: (Parent userdata, options)=>userdata.toFirestore(),
      ).doc(documentId).set(data);
    }
  }

  void HandlePageSignIn(){
    Get.back();
  }
}
