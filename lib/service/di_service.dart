
import 'package:flutter_pattern_getx/controllers/main_controller.dart';
import 'package:flutter_pattern_getx/controllers/starter_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/create_controller.dart';
import '../controllers/splash_controller.dart';

class DIService{
  static Future<void> init() async{
    //Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<SplashControll>(() => SplashControll(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
  }
}