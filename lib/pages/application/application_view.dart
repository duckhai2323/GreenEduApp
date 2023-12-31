import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:greenedu/pages/application/application_controller.dart';
import 'package:greenedu/pages/application/classmanager/management_view.dart';
import 'package:greenedu/pages/application/home/home_view.dart';
import 'package:greenedu/pages/application/messenger/messenger_view.dart';

import '../../color/colorapp.dart';
import '../../color/colorapp.dart';

class ApplicationPage extends GetView<ApplicationController>{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index){
            controller.handPageChanged(index);
          },
          children: [
            HomePage(),
            ManagementPage(),
            MessPage(),
            Center(child: Text('sfjksfksjf'),),
            Center(child: Text('sfjksfksjf'),),
          ],
        ),

        bottomNavigationBar: Obx(()=>BottomNavigationBar(
          items: controller.bottomTab,
          currentIndex: controller.state.value,
          type: BottomNavigationBarType.fixed,
          onTap: controller.handNavBarTap,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: AppColors.backgroundIntro,
          unselectedItemColor: Colors.grey,
        ),),
      ),
    );
  }
}