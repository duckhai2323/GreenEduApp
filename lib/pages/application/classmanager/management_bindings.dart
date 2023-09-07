import 'package:get/get.dart';
import 'package:greenedu/pages/application/classmanager/management_controller.dart';

class ManagementBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ManagementController());
  }
}