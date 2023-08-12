import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:greenedu/pages/application/application_controller.dart';

import '../../mess/msg.dart';
import '../../mess/msgcontent.dart';

class ChatController extends GetxController{
  late String? to_uid;
  late String? to_name ;
  late String? to_avatar;
  late String?  theFirst;
  final visible = RxBool(true);
  var doc_id = null;
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = ApplicationController.token;
  final db = FirebaseFirestore.instance;
  final listContent = <Msgcontent>[].obs;
  var listener;

  @override
  void onInit(){
    super.onInit();
    to_uid = Get.parameters['to_uid']??"";
    to_name = Get.parameters['to_name']??"";
    to_avatar = Get.parameters['to_avatar']??"";
    theFirst = Get.parameters['check_first']??"";
    if(Get.parameters['doc_id']!=""){
      doc_id = Get.parameters['doc_id'];
    }
  }

  void sendMessage(String contentStr) async {

    if(theFirst == "false") {
      var msgData  = Msg(
          from_uid: ApplicationController.token,
          to_uid: to_uid,
          from_name: ApplicationController.name,
          to_name: to_name,
          from_avatar: ApplicationController.image,
          to_avatar: to_avatar,
          last_msg: "",
          last_time: Timestamp.now(),
          msg_num: 0
      );

      await db.collection("message").withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore()
      ).add(msgData).then((value){
        doc_id = value.id;
      });
      theFirst = 'true';

      var listData = db.collection("message").doc(doc_id).collection("msglist").withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msgContent, options) => msgContent.toFirestore()
      ).orderBy("addtime",descending: false);
      listContent.clear();
      listener = listData.snapshots().listen((event) {
        for(var change in event.docChanges){
          switch (change.type){
            case DocumentChangeType.added:
              if(change.doc.data()!=null) {
                listContent.insert(0, change.doc.data()!);
              }
              break;
            case DocumentChangeType.modified:
              break;
            case DocumentChangeType.removed:
              break;

          }
        }
      });
    }
    String sendContent = contentStr;
    final content = Msgcontent(
        uid: user_id,
        content: contentStr,
        type: "text",
        addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist").withConverter(
        fromFirestore: Msgcontent.fromFirestore,
        toFirestore: (Msgcontent msgContent, options) => msgContent.toFirestore()
    ).add(content).then((DocumentReference doc){

    });
    await db.collection("message").doc(doc_id).update({
      "last_msg":contentStr,
      "last_time":Timestamp.now()
    });

    msgScrolling.animateTo(
      msgScrolling.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if(doc_id!=null) {
      var listData = db.collection("message").doc(doc_id).collection("msglist").withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msgContent, options) => msgContent.toFirestore()
      ).orderBy("addtime",descending: false);
      listContent.clear();
      listener = listData.snapshots().listen((event) {
        for(var change in event.docChanges){
          switch (change.type){
            case DocumentChangeType.added:
              if(change.doc.data()!=null) {
                listContent.insert(0, change.doc.data()!);
              }
              break;
            case DocumentChangeType.modified:
              break;
            case DocumentChangeType.removed:
              break;

          }
        }
      });
    }
  }

  void HandleBack(){
    Get.back();
  }
}