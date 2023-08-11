import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:greenedu/pages/inforclasstotutor/inforclasstotutor_controller.dart';

import '../../color/colorapp.dart';

class InforClass extends GetView<InforClassToTutorController>{

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.classInfor.isNotEmpty && controller.checkIsEmpty.value == true)?Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 3,left: 10),
          child: Text(
            'Cần gia sư môn ${controller.classInfor[0]!.subject!} - Lớp ${controller.classInfor[0]!.grade!} tại Hà Nội',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Mã lớp: ${controller.classInfor[0]!.classid!}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Container(
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Center(
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.lightBlueAccent,
                      child:CircleAvatar(
                        radius: 33,
                        backgroundImage: AssetImage('assets/images/avatar0.png')/*CachedNetworkImageProvider(url??"")*/,
                      ) ,
                    ),
                    const Positioned(
                      right: 3,
                      bottom: 3,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 20,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.parentInfor[0].fullName??"",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Hà Nội . phụ huynh',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight:  FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 20,),
                Icon(Icons.phone,size: 35,color:AppColors.backgroundIntro),
                SizedBox(width: 10,),
                Icon(CupertinoIcons.chat_bubble_text,size: 35,color:AppColors.backgroundIntro),
              ],
            ),
          ),
        ),

        Divider(
          height: 5,
          thickness: 2,
          indent: 10,
          endIndent: 10,
          color: Colors.grey.withOpacity(0.6),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text(
            '*Thông tin lớp học',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),

        ItemList(context,"Học phí:",'${controller.classInfor[0]!.money!}đ/buổi', Icon(Icons.attach_money_outlined,size: 26,color: AppColors.backgroundIntro,),AppColors.backgroundIntro),
        ItemList(context,"Số buổi: ",'${controller.classInfor[0]!.onweek!} buổi/tuần', Icon(Icons.calendar_month_outlined,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Địa điểm: ",controller.classInfor[0]!.address!, Icon(CupertinoIcons.location_solid,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Số học viên: ",'${controller.classInfor[0]!.member!} Học viên', Icon(Icons.perm_identity,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Yêu cầu: ",controller.classInfor[0]!.require!, Icon(Icons.bookmark_border,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Hình thức: ",controller.classInfor[0]!.formality!, Icon(Icons.home_outlined,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Thời gian rảnh: ", controller.classInfor[0]!.freetime!, Icon(Icons.access_time,size: 26,color: AppColors.backgroundIntro,),Colors.black),

        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text(
            '*Đặc điểm học sinh',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),

        ItemList(context,"Giới tính: ",controller.classInfor[0].sex!, Icon(Icons.people,size: 26,color: AppColors.backgroundIntro,),Colors.black),
        ItemList(context,"Học lực: ",controller.classInfor[0].capacity!, Icon(Icons.note_alt_outlined,size: 26,color: AppColors.backgroundIntro,),Colors.black),

        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10),
          child: Text(
            '*Thông tin bổ sung',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),

        ItemList(context,"Yêu cầu: ",controller.classInfor[0].demand!, Icon(Icons.book_outlined,size: 26,color: AppColors.backgroundIntro,),Colors.black),

        SizedBox(height: 15,),

        InkWell(
          onTap: (){
            controller.Subcribe();
          },
          child: Container(
            height: 38,
            width: 129,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColors.backgroundIntro,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0,1),
                  )
                ]
            ),
            child: Center(
              child: Text(
                controller.subscribe.value??"",
                style: TextStyle(
                  color: AppColors.textIntroColor,
                  fontWeight:FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Các lớp tương tự',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),

              Text(
                'Xem tất cả >',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    ):Center(
      child: Container(
          margin: EdgeInsets.only(top: 40),
          child: CircularProgressIndicator(),
      ),
    ));
  }

  Widget ItemList(BuildContext context,String text1,String text2, Icon icon, Color color){
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          SizedBox(width: 5,),
          Container(
            width: MediaQuery.of(context).size.width-50,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: text1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color:color,
                    ),
                  ),

                  TextSpan(
                    text: text2,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color:color,
                    ),
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}