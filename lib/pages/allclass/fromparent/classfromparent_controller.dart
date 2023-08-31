import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../class/classtotutor.dart';
import '../../../color/colorapp.dart';
import '../../../routes/names.dart';
import 'ItemFilter.dart';

class ClassFromParentController extends GetxController{
  List<ItemFilter> listFilter = <ItemFilter>[].obs;
  final checkArrange = true.obs;
  final listClassToTutor = <ClassToTutor>[].obs;
  final db = FirebaseFirestore.instance;
  var listener;
  final mapFilter = <String,String>{}.obs;
  @override
  void onInit(){
    super.onInit();
    checkArrange.value = false;
    listFilter.add(ItemFilter('Chọn môn học',Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),"subject"));
    listFilter.add(ItemFilter('Chọn cấp học',Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),"grade"));
    listFilter.add(ItemFilter('Chọn số buổi/tuần',Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),"onweek"));
    listFilter.add(ItemFilter('Chọn yêu cầu',Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),"require"));
    listFilter.add(ItemFilter('Chọn hình thức',Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),"formality"));
    GetData();
  }

  void SetArrange(){
    checkArrange.value?checkArrange.value = false:checkArrange.value = true;
  }

  Future<void> HandleToInfor(String id) async {
    Get.toNamed(AppRoutes.INFORCLASSTOTUTOR,arguments: id);
  }

  void HandleBack(){
    Get.back();
  }

  void GetData(){
    var data = db.collection("classtotutor").withConverter(
        fromFirestore: ClassToTutor.fromFirebase,
        toFirestore: (ClassToTutor classToTutor, options) => classToTutor.toFirebase()
    ).orderBy("timestamp",descending: false);
    for(var entry in mapFilter.entries){
      data = data.where(entry.key,isEqualTo: entry.value);
    }
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

  void ShowDialogFilter(BuildContext context,String key){
    switch(key){
      case "subject":{
        List<String> list = [];
        list.add("Toán Học");
        list.add("Hóa Học");
        list.add("Vật Lý");
        list.add("Sinh Học");
        list.add("Ngữ Văn");
        list.add("Lịch Sử");
        list.add("Địa Lý");
        list.add("Tin Học");
        list.add("Tiếng Anh");
        list.add("Khác");
        DialogFilter(context, list,"Môn học","Chọn môn học",key);
      }
      break;

      case "grade":{
        List<String> list = [];
        list.add("Lớp 1");
        list.add("Lớp 2");
        list.add("Lớp 3");
        list.add("Lớp 4");
        list.add("Lớp 5");
        list.add("Lớp 6");
        list.add("Lớp 7");
        list.add("Lớp 8");
        list.add("Lớp 9");
        list.add("Lớp 10");
        list.add("Lớp 11");
        list.add("Lớp 12");
        list.add("Khác");
        DialogFilter(context, list,"Lớp học","Chọn cấp học",key);
      }
      break;

      case "onweek":{
        List<String> list = [];
        list.add("1 buổi/tuần");
        list.add("2 buổi/tuần");
        list.add("3 buổi/tuần");
        list.add("4 buổi/tuần");
        list.add("5 buổi/tuần");
        list.add("6 buổi/tuần");
        list.add("Khác");
        DialogFilter(context, list,"Số buổi","Chọn số buổi/tuần",key);
      }
      break;

      case "require":{
        List<String> list = [];
        list.add("Giáo Viên Nam");
        list.add("Giáo Viên Nữ");
        list.add("Sinh Viên Nam");
        list.add("Sinh Viên Nữ");
        list.add("Khác");
        DialogFilter(context, list,"Yêu cầu","Chọn yêu cầu",key);
      }
      break;

      case "formality":{
        List<String> list = [];
        list.add("Offline");
        list.add("Online");
        DialogFilter(context, list,"Hình thức","Chọn hình thức",key);
      }
      break;
    }
  }

  void DialogFilter(BuildContext context,List<String> list,String title,title2,String key){
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),
      context: context,
      builder: (context){
        return Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(
                color:AppColors.backgroundIntro,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.clear,size: 30,color: Colors.white,)),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      for(int i = 0; i< listFilter.length;i++){
                        if(listFilter[i].key == key){
                          listFilter.insert(i, ItemFilter(title2,Colors.grey.shade200,Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro),key));
                          listFilter.removeAt(i+1);
                          mapFilter.remove(key);
                          GetData();
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Bỏ lọc',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext contex,index){
                    return InkWell(
                      onTap: (){
                        for(int i = 0; i< listFilter.length;i++){
                          if(listFilter[i].key == key) {
                            listFilter.insert(i, ItemFilter(
                                list[index], Colors.white,
                                AppColors.backgroundIntro, const Icon(
                              Icons.arrow_drop_down_outlined, size: 25,
                              color: AppColors.backgroundIntro,), key));
                            listFilter.removeAt(i + 1);
                            if(key == "onweek"){
                              String text = list[index];
                              mapFilter[key] = text[0];
                            } else if(key == "grade"){
                              String text = list[index].substring(list[index].indexOf(" ")+1);
                              mapFilter[key] = text;
                            } else {
                              mapFilter[key] = list[index];
                            }
                            GetData();
                          }
                        }
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index]!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        );
      }
    );
  }
}