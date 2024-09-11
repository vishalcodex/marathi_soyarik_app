import 'package:get/get.dart';
import '../../matches/controllers/match_controller.dart';
import '../../settings/controllers/settings_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<SettingsController>(SettingsController());
    Get.put<MatchController>(MatchController());
  }
}
