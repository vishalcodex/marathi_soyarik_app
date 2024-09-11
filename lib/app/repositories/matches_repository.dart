import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/interest_model.dart';
import '../models/mathc_profile_model.dart';
import '../models/profile_details_model.dart';
import '../models/search_model.dart';
import '../providers/api_provider.dart';
import 'package:dio/dio.dart' as dio;

import '../services/auth_service.dart';

class MatchesRepository {
  late ApiProvider apiProvider;

  MatchesRepository() {
    apiProvider = Get.find<ApiProvider>();
  }
  //SHORTLIST PROFILES
  Future<ApiResponse> fetchshortlistedProfiles() async {
    var body =
        dio.FormData.fromMap({"user_id": Get.find<AuthService>().token!});
    // body.fields.add(MapEntry("user_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "show_shortlist_profile.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["profiles"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //MATCHED PROFILES
  Future<ApiResponse> fetchMatchedProfiles(int page) async {
    var body = dio.FormData.fromMap(
        {"id": Get.find<AuthService>().token!, "page": page});
    return await apiProvider
        .makeAPICall("POST", "matches.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // value.data = (value.data["matches"] as List)
        //     .map((e) => MatchProfile.fromJson(e))
        //     .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //VIEWED MY PROFILE
  Future<ApiResponse> fetchViewedMyProfiles() async {
    var body = dio.FormData.fromMap({"id": Get.find<AuthService>().token!});
    return await apiProvider
        .makeAPICall("POST", "viewed_my_profile.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["packages"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //VIEWED PROFILE
  Future<ApiResponse> fetchViewedProfiles(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "viewed_profile.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["packages"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //SEND INTREST
  Future<ApiResponse> sendIntrest(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("sender_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "send-interest.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //ADD TO SHORTLIST
  Future<ApiResponse> addToShortlist(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("user_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "shortlist.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //PROFILE DETAILS
  Future<ApiResponse> fetchProfileDetails(var data) async {
    var body = dio.FormData.fromMap(data);
    // body.fields.add(MapEntry("id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "profile-details.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = ProfileDetails.fromJson(value.data["user"]);
      } else {}
      return value;
    });
  }

  //UPDATE BLOCKLIST
  Future<ApiResponse> updateBlockList(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("user_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "add_block_list.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //VIEWED MY PROFILE
  Future<ApiResponse> fetchBlockedProfiles() async {
    var body =
        dio.FormData.fromMap({"user_id": Get.find<AuthService>().token!});
    return await apiProvider
        .makeAPICall("POST", "show_Blocked_Profile.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["profiles"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //SENT INTEREST PROFILES
  Future<ApiResponse> fetchSentIntresetProfiles() async {
    var body =
        dio.FormData.fromMap({"sender_id": Get.find<AuthService>().token!});
    return await apiProvider
        .makeAPICall("POST", "Sent_interest.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["profiles"] as List)
            .map((e) => Interest.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //RECEIVED INTEREST PROFILES
  Future<ApiResponse> fetchReceivedIntresetProfiles() async {
    var body =
        dio.FormData.fromMap({"User_id": Get.find<AuthService>().token!});
    return await apiProvider
        .makeAPICall("POST", "Received_interest.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["profiles"] as List)
            .map((e) => Interest.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  //UPDATE INTEREST PROFILES
  Future<ApiResponse> updateInterestStatus(var data) async {
    var body = dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "update_status.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //SEARCH PROFILES
  Future<ApiResponse> searchProfiles(Search data) async {
    var body = dio.FormData.fromMap(data.toJson());
    return await apiProvider
        .makeAPICall("POST", "search.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = (value.data["data"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList();
      } else {
        value.data = [];
      }
      return value;
    });
  }

  Future<ApiResponse> searchProfilesById(
      MatchProfile matchProfile, int page) async {
    var body = dio.FormData.fromMap(
        {"id": matchProfile.profileId, "page": page.toString()});
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

//SEND CHAT COUNT
  Future<ApiResponse> sendChatRequest(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("sender_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "send-chat.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //SEND CONTACT COUNT
  Future<ApiResponse> sendContactRequest(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("sender_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "send-contact.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }

  //SEND VIEW PROFILE COUNT
  Future<ApiResponse> sendViewProfileUpdate(var data) async {
    var body = dio.FormData.fromMap(data);
    body.fields.add(MapEntry("viewer_id", Get.find<AuthService>().token!));
    return await apiProvider
        .makeAPICall("POST", "view_profile.php", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
      } else {}
      return value;
    });
  }
}
