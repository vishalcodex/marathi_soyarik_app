import 'package:marathi_soyarik/app/services/auth_service.dart';
import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository {
  late ApiProvider apiProvider;

  UserRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  // Future<ApiResponse> signUp(String phoneNo) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/signup", {"phone": phoneNo}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> verifyOtp(creds) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/verify-otp", creds)
  //       .then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       User user = User.fromJson(value.data["user"]);
  //       user.token = value.data["token"];
  //       value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> setVpin(String vpin) async {
  //   return await apiProvider
  //       .makeAPICall("POST", "api/set-vpin", {"vpin": vpin}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  // Future<ApiResponse> setPassword(String password) async {
  //   return await apiProvider.makeAPICall(
  //       "POST", "api/set-password", {"password": password}).then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       // User user = User.fromJson(value.data["user"]);
  //       // user.token = value.data["token"];
  //       // value.data = user;
  //     }
  //     return value;
  //   });
  // }

  Future<ApiResponse> login(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider
        .makeAPICall("POST", "login.php", data)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"] ?? {});
        user.userId = value.data["user_id"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> forgotPassword(String email) async {
    return await apiProvider
        .makeAPICall("POST", "forgot-password.php",
            dio.FormData.fromMap({"email": email}))
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchUserDetails() async {
    var body = dio.FormData.fromMap({"id": Get.find<AuthService>().token!});
    return await apiProvider
        .makeAPICall("POST", "profile-details.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> logout() async {
    return await apiProvider.makeAPICall("GET", "logout", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> register(creds) async {
    var data = dio.FormData.fromMap(creds);
    return await apiProvider
        .makeAPICall("POST", "register.php", data)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }
}
