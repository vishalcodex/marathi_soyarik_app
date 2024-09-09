import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class AccountController extends GetxController {
  AccountController() {}

  bool fromRegister = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      fromRegister = Get.arguments["from_register"] ?? false;
    }
  }

  void logout() {
    Get.find<AuthService>().removeCurrentUser();
    Get.offAndToNamed(Routes.AUTH);
  }
}
