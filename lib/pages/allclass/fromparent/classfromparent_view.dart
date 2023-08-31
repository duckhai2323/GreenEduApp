import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/allclass/fromparent/classfromparent_controller.dart';
import 'package:greenedu/pages/allclass/fromparent/display_class.dart';
import 'package:greenedu/pages/allclass/fromparent/filter.dart';
import 'package:greenedu/pages/allclass/fromparent/gridlistclass.dart';

import '../../../color/colorapp.dart';

class ClassFromParentPage extends GetView<ClassFromParentController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:AppColors.backgroundIntro,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              height: 1,
            ),
          ),
          leading: InkWell(
            onTap: (){
              controller.HandleBack();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.backgroundColor,
            ),
          ),
          flexibleSpace: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 50,right: 10),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 5,left: 10),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search,color: Colors.grey,size: 25,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.grey.shade200,width: 1),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: AppColors.backgroundIntro),
                        ),
                        hintText: 'Tìm kiếm môn học',
                        hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,),
                      ),
                      onTap: (){
                      },
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications_active_outlined,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                    Icon(CupertinoIcons.chat_bubble_text,color:Colors.white,size: 30,),
                    SizedBox(width: 10,),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,bottom: 10,right: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined,size: 30,color: AppColors.backgroundIntro,),
                        RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Khu vực: ',
                                  style: TextStyle(
                                    fontSize: 17,
                                      color: Colors.grey.shade400,
                                  ),
                                ),

                                TextSpan(
                                  text: 'Hà Nội',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color:Colors.black,
                                  ),
                                ),
                              ]
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_outlined,size: 25,color: AppColors.backgroundIntro,),
                      ],
                    ),

                    InkWell(
                      onTap: (){
                        controller.SetArrange();
                      },
                        child:  Obx(() => !controller.checkArrange.value?Icon(Icons.window_outlined,size: 35,color: AppColors.backgroundIntro,):Icon(Icons.menu_outlined,size: 35,color: AppColors.backgroundIntro,),),
                    ),
                  ],
                ),
              ),
              FilterWidget(),
              SizedBox(height: 20,),
              Obx(() => !controller.checkArrange.value?ListClass():GridViewList()),
            ],
          ),
        ),
      ),
    );
  }
}