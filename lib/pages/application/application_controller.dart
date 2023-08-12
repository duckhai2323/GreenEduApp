import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../color/colorapp.dart';

class ApplicationController extends GetxController{
  static late String token;
  static late String image;
  static late String name;
  ApplicationController();
  final state = 0.obs;
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTab;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    token = Get.parameters['userId']??"";
    image = Get.parameters['image']??"";
    name = Get.parameters['name']??"";
    bottomTab = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.house_fill,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Home',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_month_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.calendar_month,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Quản lí',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.chat_bubble_text,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          CupertinoIcons.chat_bubble_text_fill,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Chat',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_active_outlined,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.notifications_active,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Thông báo',
        backgroundColor: Colors.transparent,
      ),

      const BottomNavigationBarItem(
        icon: Icon(
          Icons.perm_identity,
          color: Colors.grey,
          size: 25,
        ),

        activeIcon: Icon(
          Icons.person,
          color: AppColors.backgroundIntro,
          size: 25,
        ),
        label: 'Tôi',
        backgroundColor: Colors.transparent,
      ),
    ];
    pageController = PageController(initialPage: state.value);
  }

    @override
    void dispose() {
      pageController.dispose();
      super.dispose();
    }

    void handPageChanged(int index) {
      state.value = index;
    }

    void handNavBarTap(int index) {
      pageController.jumpToPage(index);
    }
}