import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:greenedu/pages/application/home/display_hotclass.dart';
import 'package:greenedu/pages/application/home/display_sentar.dart';
import 'package:greenedu/pages/application/home/display_subjects.dart';
import 'package:greenedu/pages/application/home/home_appbar.dart';
import 'package:greenedu/pages/application/home/home_controller.dart';
import 'package:greenedu/pages/application/home/point_home.dart';

import '../../../color/colorapp.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 96,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 68,
                    color: AppColors.backgroundIntro,
                    child: HomeAppBar(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0,1),
                            )
                          ]
                      ),
                      child:const TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm môn học',
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.search,size: 30,color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PointHome(),
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom:15 ),
              child: Text(
                'Khám phá môn học',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),

              ),
            ),
            DisplaySubjects(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              width: MediaQuery.of(context).size.width,
              height: 370,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.logoColor, Color.fromRGBO(175,247,191, 1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15,bottom:15),
                    child: Text(
                      'Yêu cầu gia sư ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  
                  ListClass1(),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    height: 43,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.8),
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: const Center(
                      child: Text(
                        'Xem tất cả các lớp',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight:FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10,bottom:15,right: 10 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trung tâm luyện thi',
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

            ListSentar(),
          ],
        ),
      ),
    );
  }
}