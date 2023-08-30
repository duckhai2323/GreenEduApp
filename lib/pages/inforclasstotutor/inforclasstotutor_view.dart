
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
        appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundIntro,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 23,
                  color: AppColors.backgroundColor,
                  onPressed: (){
                    controller.HandleBack();
                  },
                ),
              ],
            ),
            const Text(
              'Chi tiết',
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

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