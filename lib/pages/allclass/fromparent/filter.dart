import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:greenedu/pages/allclass/fromparent/classfromparent_controller.dart';

import '../../../color/colorapp.dart';

class FilterWidget extends GetView<ClassFromParentController>{

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin:const  EdgeInsets.only(left: 15),
          height:42,
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.backgroundColor,
            border: Border.all(
              color: AppColors.backgroundIntro,
              width: 1,
            ),
          ),
          child:const  Row(
            children: [
              Icon(IconData(0xf068, fontFamily: 'MaterialIcons'),color: AppColors.backgroundIntro,size: 30,),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  'Lọc',
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
          child: Container(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:controller.listFilter.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context,index){
                return ItemList(controller.listFilter[index].text??"", controller.listFilter[index].color!, controller.listFilter[index].icon!);
              },
            ),
          ),
        ),
      ],
    ),);
  }

  Widget ItemList(String text, Color color, Icon icon){
    return Container(
      margin: EdgeInsets.only(left: 10),
      height:42,
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: icon,
          ),
        ],
      ),
    );
  }
}
