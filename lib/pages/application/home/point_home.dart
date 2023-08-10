import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/application/home/home_controller.dart';

class PointHome extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 8),
            width: MediaQuery.of(context).size.width/2-25,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.grey.withOpacity(0.16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Xếp hạng',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Top 20',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
                
                Container(
                  alignment: Alignment.bottomRight,
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/images/home1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 8),
            width: MediaQuery.of(context).size.width/2-25,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.grey.withOpacity(0.16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Điểm thưởng',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),

                Container(
                  alignment: Alignment.bottomRight,
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/images/home2.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}