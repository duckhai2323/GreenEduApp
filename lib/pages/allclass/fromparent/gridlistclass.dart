import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/allclass/fromparent/classfromparent_controller.dart';

import '../../../class/classtotutor.dart';
import '../../../color/colorapp.dart';

class GridViewList extends GetView<ClassFromParentController>{

  @override
  Widget build(BuildContext context) {
    List<ClassToTutor> list = controller.listClassToTutor;
    return Obx(()=>Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10),
      child: Center(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 0, // Spacing between columns
            mainAxisSpacing: 10,
            mainAxisExtent: 240,// Spacing between rows
          ),
          itemCount: list.length, // Total number of grid items
          itemBuilder: (BuildContext context, int index) {
            // Builder function that creates each grid item
            final item = list[index];
            return InkWell(
              onTap: (){
                controller.HandleToInfor(item.classid!);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                width: 195,
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
                      width: 195,
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
                      width: 195,
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
      ),
    ),);
  }

  Widget ItemList(String content, Icon icon, Color color){
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Expanded(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color:color,
              ),
            ),
          )
        ],
      ),
    );
  }
}