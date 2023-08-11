import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/class/classtotutor.dart';

import '../../../color/colorapp.dart';
import 'home_controller.dart';

class ListClass1 extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    List<ClassToTutor> list = controller.listClassToTutor;
    return Obx(()=>Container(
      height: 240,
      margin: EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length<=5?list.length:5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index){
          final item = list[index];
          return InkWell(
            onTap: (){
              controller.HandleToInfor(item.classid!);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 185,
              height: 240,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  Container(
                    width: 185,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        color: Colors.grey.withOpacity(0.2)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.qr_code_scanner,size: 30,color: AppColors.backgroundIntro,),
                          const SizedBox(width: 5,),
                          Text(
                            item.classid!,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 200,
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemList(item.subject! + ' - Lớp ' + item.grade! , Icon(Icons.book_outlined,size: 25,color: AppColors.backgroundIntro,), Colors.black),
                        ItemList("Hà Nội",Icon(CupertinoIcons.location_solid,size: 25,color: AppColors.backgroundIntro,),Colors.black),
                        ItemList(item.money! + 'đ/buổi', Icon(Icons.attach_money_outlined,size: 25,color: AppColors.backgroundIntro,),AppColors.backgroundIntro),
                        ItemList(item.onweek! + ' buổi/tuần', Icon(Icons.timeline,size: 25,color: AppColors.backgroundIntro,),Colors.black),
                        ItemList(item.require!, Icon(Icons.bookmark_border,size: 25,color: AppColors.backgroundIntro,),Colors.black),
                        ItemList(item.formality!, Icon(Icons.home_outlined,size: 25,color: AppColors.backgroundIntro,),Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  Widget ItemList(String content, Icon icon, Color color){
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Text(
            content,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color:color,
            ),
          )
        ],
      ),
    );
  }
}