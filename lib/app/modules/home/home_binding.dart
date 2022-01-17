import 'package:get/get.dart';
import 'package:pricing/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeControler());
  }
}
