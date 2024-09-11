import 'dart:developer';

import 'package:marathi_soyarik/app/models/partner_preference_model.dart';
import 'package:marathi_soyarik/app/models/user_model.dart';
import 'package:get/get.dart';

import '../models/api_response.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class MembershipRepository {
  late ApiProvider apiProvider;

  MembershipRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  //PERSONAL

  Future<ApiResponse> saveBasicDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);

    return await apiProvider
        .makeAPICall("POST", "basic-details-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchBasicDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-basic-details.php", body)
        .then((value) {
      log(value.data.toString());
      if (value.status == Status.COMPLETED) {
        value.data = BasicDetails.fromJson(value.data["data"]);
      } else {
        value.data = BasicDetails();
      }
      return value;
    });
  }

  //Religious
  Future<ApiResponse> saveReligiousDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "religious-info-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchReligiousDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-religious-info.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = ReligiousDetails.fromJson(value.data["data"]);
      } else {
        value.data = ReligiousDetails();
      }
      return value;
    });
  }

  Future<ApiResponse> saveEducationDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "education-occupation-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchEducationDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-education-occupation.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = EducationDetails.fromJson(value.data["data"]);
      } else {
        value.data = EducationDetails();
      }
      return value;
    });
  }

  Future<ApiResponse> saveLifestyleDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "lifestyle-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchLifestyleDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-lifestyle.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = LifestyleDetails.fromJson(value.data["data"]);
      } else {
        value.data = LifestyleDetails();
      }
      return value;
    });
  }

  Future<ApiResponse> saveLocationDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "location-details-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchLocationDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-location-details.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = LocationDetails.fromJson(value.data["data"]);
      } else {
        value.data = LocationDetails();
      }
      return value;
    });
  }

  Future<ApiResponse> saveFamilyDetails(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "family-details-update.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchFamilyDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-family-details.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = FamilyDetails.fromJson(value.data["data"]);
      } else {
        value.data = FamilyDetails();
      }
      return value;
    });
  }

  Future<ApiResponse> saveIdProofNProfile(var data) async {
    log(data.toString());

    return saveIdProof(data).then((value) async {
      if (value.status == Status.COMPLETED) {
        return await saveProfilePic(data).then((value) {
          if (value.status == Status.COMPLETED) {
            value.data = value.status == Status.COMPLETED;
            return value;
          } else {
            return value;
          }
        });
      } else {
        return value;
      }
    });
  }

  //SAVE ID PROOF
  Future<ApiResponse> saveIdProof(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    body.fields.removeWhere((element) => element.key == "id_proof");
    if (data["id_proof"] != "" &&
        !data["id_proof"].toString().contains("download")) {
      body.files.add(
        MapEntry(
          "file",
          await dio.MultipartFile.fromFile(data["id_proof"],
              filename: data["id_proof"].toString().split("/").last),
        ),
      );
    }

    return await apiProvider
        .makeAPICall("POST", "upload-document.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  //SAVE PROFILE PIC
  Future<ApiResponse> saveProfilePic(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    body.fields.removeWhere((element) => element.key == "profile_pic");
    if (data["profile_pic"] != "" &&
        !data["profile_pic"].toString().contains("download")) {
      body.files.add(
        MapEntry(
          "file",
          await dio.MultipartFile.fromFile(data["profile_pic"],
              filename: data["profile_pic"].toString().split("/").last),
        ),
      );
    }

    return await apiProvider
        .makeAPICall("POST", "upload-other-pictures.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchUploadData(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get-document.php", body)
        .then((value) async {
      log(value.data.toString());
      if (value.status == Status.COMPLETED) {
        var imageData = {"idProof": value.data["data"]["aadhar"]};
        var body = dio.FormData.fromMap(data);
        return apiProvider
            .makeAPICall("POST", "get-other-pictures.php", body)
            .then((value) {
          log(value.data.toString());
          if (value.status == Status.COMPLETED) {
            imageData["profilePic"] = [
              value.data["data"]["photo2"],
              value.data["data"]["photo3"],
              value.data["data"]["photo4"],
            ];
          }
          value.data = imageData;
          return value;
        });
      }
      return value;
    });
  }

  //Basic Preference
  Future<ApiResponse> saveBasicPreference(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);

    return await apiProvider
        .makeAPICall("POST", "update_partner_preferance.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchBasicPreference(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get_partner_preferance.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = BasicPreference.fromJson(value.data["data"]);
      } else {
        value.data = BasicPreference();
      }
      return value;
    });
  }

  //Religious Preference
  Future<ApiResponse> saveReligiousPreference(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update_religious_preference.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchReligiousPreference(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get_religious_preference.php", body)
        .then((value) {
      // log(value.data.toString());
      if (value.status == Status.COMPLETED) {
        value.data = ReligiousPreference.fromJson(value.data["data"]);
      } else {
        value.data = ReligiousPreference();
      }
      return value;
    });
  }

  //Location Preference
  Future<ApiResponse> saveLocationPreference(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update_Location_Details.php", body)
        .then((value) {
      log(value.data.toString());
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchLocationPreference(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get_Location_Details.php", body)
        .then((value) {
      log(value.data.toString());
      if (value.status == Status.COMPLETED) {
        value.data = LocationPreference.fromJson(value.data["data"]);
      } else {
        value.data = LocationPreference();
      }
      return value;
    });
  }

  //Education Preference
  Future<ApiResponse> saveEducationPreference(var data) async {
    log(data.toString());
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update_education_occupation_preferance.php", body)
        .then((value) {
      value.data = Status.COMPLETED == value.status;
      return value;
    });
  }

  Future<ApiResponse> fetchEducationPreference(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get_education_occupation_preferance.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = EducationPreference.fromJson(value.data["data"]);
      } else {
        value.data = EducationPreference();
      }
      return value;
    });
  }
}
