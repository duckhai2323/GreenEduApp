import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:greenedu/user/tutor.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/names.dart';

class SignupController extends GetxController{
  final firebaseAuth = FirebaseAuth.instance;
  final firebase = FirebaseFirestore.instance;
  var obscureText1_ = true.obs;
  var obscureText2_ = true.obs;
  var value_ = 0.obs;
  var image = File('').obs;
  var checkClickImage = false.obs;
  SignupController();
  Future<void> PickImage() async {
    try{
      var image_ = await ImagePicker().pickImage(source: ImageSource.gallery);
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
      String image,
      String fullName,
      String birthday,
      String email,
      String password,
      String numberPhone,) async {

    String role = '';
    if(value_.value == 0){

    }else if(value_.value == 1){
      role = "1";
    }else {
      role = "2";
    }
    String documentId = firebase.collection("users").doc().id;
    var data  = Tutor(documentId, image, fullName, birthday, email, password, numberPhone, role);
    await firebase.collection('users').withConverter(
      fromFirestore: Tutor.fromFirestore,
      toFirestore: (Tutor userdata, options)=>userdata.toFirestore(),
    ).add(data);
  }

  void HandlePageSignIn(){
    Get.back();
  }
}
