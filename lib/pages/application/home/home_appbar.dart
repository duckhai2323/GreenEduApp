import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../color/colorapp.dart';
import 'home_controller.dart';

class HomeAppBar extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 20,right: 20,bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:[
          InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                    size: 37,
                  ),
                ),

                const Positioned(
                  top: 3,
                  right: 3,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Expanded(
            child:Center(
              child: Text(
                'GreenEdu',
                style: TextStyle(
                  color: AppColors.textIntroColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Stack(
            children: [
              Container(
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.note_alt_outlined,
                  color: Colors.white,
                  size: 33,
                ),
              ),

              const Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}