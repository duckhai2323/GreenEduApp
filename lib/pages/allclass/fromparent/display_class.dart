import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/allclass/fromparent/classfromparent_controller.dart';

import '../../../class/classtotutor.dart';
import '../../../color/colorapp.dart';

class ListClass extends GetView<ClassFromParentController>{
  @override
  Widget build(BuildContext context) {
    List<ClassToTutor> list = controller.listClassToTutor;
    return Obx(()=>Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context,index){
          return InkWell(
            onTap: (){
              controller.HandleToInfor(list[index].classid!);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 183,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,1),
                    )
                  ]
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Cần gia sư môn ${list[index].subject} lớp ${list[index].grade} tại Hà Nội',
                           overflow: TextOverflow.ellipsis,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                           ),
                         ),

                         ItemList("Mã lớp: ${list[index].classid}", Icon(Icons.qr_code_scanner,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                         ItemList("Số buổi: ${list[index].onweek} buổi/tuần", Icon(Icons.calendar_month_outlined,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                         ItemList("${list[index].money}đ/1 buổi", Icon(Icons.attach_money_outlined,size: 25,color: AppColors.backgroundIntro,),AppColors.backgroundIntro),
                         ItemList("Yêu cầu: ${list[index].require}", Icon(Icons.bookmark_border,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                         ItemList("Hình thức: ${list[index].formality}", Icon(Icons.home_outlined,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                       ],
                     ),
                   ),
                 ),
                 Icon(
                   Icons.arrow_forward_ios,
                   color: AppColors.backgroundIntro,
                 ),
               ],
              ),
            ),
          );
        },
      ),
    ),);
  }

  Widget ItemList(String content, Icon icon, Color color){
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color:color,
            ),
          )
        ],
      ),
    );
  }
}