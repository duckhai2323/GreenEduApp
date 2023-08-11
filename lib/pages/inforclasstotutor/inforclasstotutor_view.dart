
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenedu/pages/inforclasstotutor/display_listclass.dart';
import 'package:greenedu/pages/inforclasstotutor/inforclasstotutor_controller.dart';

import '../../class/classtotutor.dart';
import '../../color/colorapp.dart';
import 'display_inforclass.dart';

class InforClassToTutorPage extends GetView<InforClassToTutorController>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: AppColors.backgroundIntro,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: InkWell(
                        onTap: (){
                          controller.HandleBack();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios,size: 23,color: Colors.white,),
                            Text(
                              'Lớp mới',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 80),

                    const Text(
                      'Chi tiết',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),

              InforClass(),

              ListClass2(),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}