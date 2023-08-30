import 'package:get/get.dart';
import 'package:greenedu/pages/allclass/fromparent/classfromparent_controller.dart';

class ClassFromParentBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ClassFromParentController());
  }
}