import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:greenedu/class/classtotutor.dart';

class HomeController extends GetxController{
  HomeController();
  final listClassToTutor = <ClassToTutor>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;

  @override
  void onReady(){
    super.onReady();
    var data = db.collection("classtotutor").withConverter(
      fromFirestore: ClassToTutor.fromFirebase,
      toFirestore: (ClassToTutor classToTutor, options) => classToTutor.toFirebase()
    ).orderBy("timestamp",descending: false);
    listClassToTutor.clear();
    listener = data.snapshots().listen((event) {
      for(var change in event.docChanges){
        switch (change.type){
          case DocumentChangeType.added:
            if(change.doc.data()!=null) {
              listClassToTutor.insert(0, change.doc.data()!);
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