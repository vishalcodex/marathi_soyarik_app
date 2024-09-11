import 'package:marathi_soyarik/app/models/my_package_details.dart';
import 'package:marathi_soyarik/app/services/auth_service.dart';
import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/master_data_model.dart';
import '../models/package_model.dart';
import '../models/search_model.dart';
import '../models/success_story_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

class SettingsRepository {
  late ApiProvider apiProvider;

  SettingsRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  //PACKAGES
  Future<ApiResponse> fetchPackages() async {
    return await apiProvider
        .makeAPICall("GET", "packages.php", null)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["packages"] as List)
            .map((e) => Package.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchMyPackage() async {
    var body =
        dio.FormData.fromMap({"id": Get.find<AuthService>().user.value.userId});
    body.fields.add(MapEntry("id", Get.find<AuthService>().user.value.userId!));
    return await apiProvider
        .makeAPICall("POST", "my_package.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = MyPackageDetails.fromJson(value.data);
      } else {
        value.data = MyPackageDetails.fromJson({});
      }
      return value;
    });
  }

  Future<ApiResponse> fetchCountries() async {
    return await apiProvider.makeAPICall(
        "GET", "master-data.php", {"data": "countries"}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["countries"] as List)
            .map((e) => Country.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchStatesByCountry(Country country) async {
    return await apiProvider.makeAPICall("GET", "master-data.php",
        {"data": "states", "country_id": country.id}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["states"] as List)
            .map((e) => State.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchCitiesByState(State state) async {
    return await apiProvider.makeAPICall("GET", "master-data.php",
        {"data": "cities", "state_id": state.id}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["cities"] as List)
            .map((e) => City.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchEductaionOptions() async {
    return await apiProvider.makeAPICall(
        "GET", "master-data.php", {"data": "jobcategories"}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["jobcategories"] as List)
            .map((e) => Education.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchMotherToungesOptions() async {
    return await apiProvider.makeAPICall(
        "GET", "master-data.php", {"data": "mothertongues"}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["mothertongues"] as List)
            .map((e) => MotherTounge.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> fetchCastes() async {
    return await apiProvider.makeAPICall(
        "GET", "master-data.php", {"data": "castes"}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["castes"] as List)
            .map((e) => Caste.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //SEARCH PROFILES
  Future<ApiResponse> searchProfiles(Search data, int page) async {
    var body = dio.FormData.fromMap(data.toJson());
    body.fields.add(MapEntry("page", page.toString()));
    return await apiProvider
        .makeAPICall("POST", "search.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // value.data = (value.data["profiles"] as List)
        //     .map((e) => MatchProfile.fromJson(e))
        //     .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //SUCCESS STORIES
  Future<ApiResponse> getSuccessStories() async {
    return await apiProvider
        .makeAPICall("GET", "success-stories.php", null)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["stories"] as List)
            .map((e) => SuccessStory.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }
}
