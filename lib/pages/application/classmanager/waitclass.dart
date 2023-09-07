import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/application/classmanager/management_controller.dart';

import '../../../color/colorapp.dart';

class WaitClass extends GetView<ManagementController>{

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context,index){
            return  InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 272,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.perm_identity,size: 30,color: AppColors.backgroundIntro,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Kha Banh',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Divider(),

                                Text(
                                  'Cần gia sư môn lớp tại Hà Nội',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                                ItemList("Mã lớp: ", Icon(Icons.qr_code_scanner,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                                ItemList("Số buổi: buổi/tuần", Icon(Icons.calendar_month_outlined,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                                ItemList("đ/1 buổi", Icon(Icons.attach_money_outlined,size: 25,color: AppColors.backgroundIntro,),AppColors.backgroundIntro),
                                ItemList("Yêu cầu:", Icon(Icons.bookmark_border,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
                                ItemList("Hình thức:", Icon(Icons.home_outlined,size: 25,color: AppColors.backgroundIntro,),Colors.grey),
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

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Tình trạng:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            height: 38,
                            width: 130,
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
                                'Đang Chờ',
                                style: TextStyle(
                                  color: AppColors.textIntroColor,
                                  fontWeight:FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
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
    );
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