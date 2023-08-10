import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../color/colorapp.dart';
import 'home_controller.dart';

class ListClass1 extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, indext){
          return Container(
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
                      borderRadius: BorderRadius.only(
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
                        Icon(Icons.qr_code_scanner,size: 30,color: AppColors.backgroundIntro,),
                        const SizedBox(width: 5,),
                        Text(
                          'T123',
                          style: TextStyle(
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
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemList("Toán - Lớp 11", Icon(Icons.book_outlined)),
                      ItemList("Toán - Lớp 11", Icon(Icons.book_outlined)),
                      ItemList("Toán - Lớp 11", Icon(Icons.book_outlined)),
                      ItemList("Toán - Lớp 11", Icon(Icons.book_outlined)),
                      ItemList("Toán - Lớp 11", Icon(Icons.book_outlined)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget ItemList(String content, Icon icon){
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(Icons.book_outlined,size: 25,color: AppColors.backgroundIntro,),
          SizedBox(width: 5,),
          Text(
            'Toán - Lớp 11',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}