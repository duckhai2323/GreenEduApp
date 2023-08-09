import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:greenedu/routes/names.dart';

class WelcomeController extends GetxController{
  var state = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  WelcomeController();
  void ChangedPage(int index){
    state.value = index;
  }
  void OnClickNext(){
    if(state.value < 3){
      pageController.animateToPage(state.value+1, duration: Duration(microseconds: 400), curve: Curves.decelerate);
    }else {
      Get.offAndToNamed(AppRoutes.SIGN_IN);
    }
  }
}