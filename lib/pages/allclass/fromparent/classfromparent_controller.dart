import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../color/colorapp.dart';
import 'ItemFilter.dart';

class ClassFromParentController extends GetxController{
  List<ItemFilter> listFilter = <ItemFilter>[].obs;
  final checkArrange = true.obs;
  @override
  void onInit(){
    super.onInit();
    checkArrange.value = false;
    listFilter.add(ItemFilter('Chọn môn học',Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro)));
    listFilter.add(ItemFilter('Chọn cấp học',Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro)));
    listFilter.add(ItemFilter('Chọn số buổi/tuần',Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro)));
    listFilter.add(ItemFilter('Chọn yêu cầu',Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro)));
    listFilter.add(ItemFilter('Chọn hình thức',Colors.grey.shade200, Icon(Icons.add,size: 20,color:AppColors.backgroundIntro)));
  }

  void SetArrange(){
    checkArrange.value?checkArrange.value = false:checkArrange.value = true;
  }
}