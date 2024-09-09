import 'package:marathi_soyarik/app/components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../models/api_response.dart';
import '../../../models/interest_model.dart';
import '../../../models/mathc_profile_model.dart';
import '../../../models/profile_details_model.dart';
import '../../../repositories/matches_repository.dart';
import '../../../routes/app_routes.dart';
import '../widgets/basic_details_view.dart';
import '../widgets/education_details_view.dart';
import '../widgets/family_details_view.dart';
import '../widgets/lifestyle_details_view.dart';
import '../widgets/location_details_view.dart';
import '../widgets/partner_preference_details_view.dart';
import '../widgets/religious_details_view.dart';

class MatchController extends GetxController {
  late MatchesRepository _matchesRepository;
  MatchController() {
    _matchesRepository = MatchesRepository();
  }

  @override
  void onInit() {
    super.onInit();
    searchMatchesScrollController.addListener(() {
      if (searchMatchesScrollController.position.pixels ==
              searchMatchesScrollController.position.maxScrollExtent &&
          page.value < totalPage.value) {
        page.value = page.value + 1;
        isLoading.value = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          searchMatchesScrollController
              .jumpTo(searchMatchesScrollController.position.maxScrollExtent);
          searchMacthesById(false);
        });
      }
    });
    fetchData();
  }

  RxBool isLoading = false.obs;
  // VIEWED MY PROFILE
  RxList<MatchProfile> viewedMyProfiles = <MatchProfile>[].obs;

  void fetchViewedMyProfiles() async {
    isLoading.value = true;
    await _matchesRepository.fetchViewedMyProfiles().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        viewedMyProfiles.value = value.data;
        viewedMyProfiles.refresh();
      }
    });
  }

  void fetchData() {
    fetchViewedMyProfiles();
    fetchSentInterestProfiles();
    fetchReceivedInterestProfiles();
  }

  Future<bool> sendIntrestTo(MatchProfile profile, BuildContext context) async {
    return await _matchesRepository
        .sendIntrest({"recipient_id": profile.profileId}).then((value) {
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 3),
          message: "Interest Sent !",
        ));
      } else {
        showErrorDialog(
          context,
          value.message ?? "Error Updating Interest !",
        );
      }
      return value.status == Status.COMPLETED;
    });
  }

  Future<bool> addToShorlist(MatchProfile profile) async {
    return await _matchesRepository
        .addToShortlist({"profile_id": profile.profileId}).then((value) {
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 3),
          message: "Profile Shortlisted !",
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: const Duration(seconds: 3),
          message: value.message ?? "Error Shortlisting Profile !",
        ));
      }
      return value.status == Status.COMPLETED;
    });
  }

  Rx<ProfileDetails> selectedProfile = ProfileDetails().obs;
  RxBool isMyProfile = false.obs;

  fecthProfileDetails(MatchProfile profile, bool myProfile) async {
    showContact.value = false;
    selectedProfile = ProfileDetails().obs;
    isMyProfile.value = myProfile;
    await _matchesRepository
        .fetchProfileDetails({"id": profile.profileId}).then((value) {
      ;
      if (value.status == Status.COMPLETED) {
        selectedProfile.value = value.data;
        selectedProfileTab.value = "Basic";
        isMyProfile.value = myProfile;
        selectedProfile.refresh();
        // Get.toNamed(Routes.PROFILE_DETAILS);
      }
    });
  }

  List<Map<String, dynamic>> profileTabs = [
    {"name": "Basic", "view": const BasicDetailsView()},
    {"name": "Religious", "view": const ReligiousDetailsView()},
    {"name": "Education & Occupation", "view": const EducationDetailsView()},
    {"name": "Lifestyle", "view": const LifestyleDetailsView()},
    {"name": "Location", "view": const LocationDetailsView()},
    {"name": "Family", "view": const FamilyDetailsView()},
    {"name": "Partner Preference", "view": const PartnerPreferenceDetailView()},
  ];

  RxString selectedProfileTab = "Basic".obs;

  Widget getSelelectedTabView() {
    return profileTabs
        .where((element) => element["name"] == selectedProfileTab.value)
        .first["view"];
  }

  Future<bool> updateBlockList(
      MatchProfile profile, String status, BuildContext context) async {
    return await _matchesRepository.updateBlockList(
        {"profile_id": profile.profileId, "status": status}).then((value) {
      isBloacking.value = false;
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 3),
          message: "Profile Added to Block List !",
        ));
      } else {
        showErrorDialog(
          context,
          value.message ?? "Error Blocking this Profile !",
        );
      }
      return value.status == Status.COMPLETED;
    });
  }

  // BLOCKED PROFILE
  RxList<MatchProfile> blockedProfiles = <MatchProfile>[].obs;

  void fetchBlockedProfiles() async {
    isLoading.value = true;
    await _matchesRepository.fetchBlockedProfiles().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        blockedProfiles.value = value.data;
        blockedProfiles.refresh();
      }
    });
  }

  // SENT INTERESTS PROFILE
  RxList<Interest> sentInterestsProfiles = <Interest>[].obs;

  void fetchSentInterestProfiles() async {
    isLoading.value = true;
    await _matchesRepository.fetchSentIntresetProfiles().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        sentInterestsProfiles.value = value.data;
        sentInterestsProfiles.refresh();
      }
    });
  }

  // RECEIVED INTERESTS PROFILE
  RxList<Interest> receivedInterestsProfiles = <Interest>[].obs;

  void fetchReceivedInterestProfiles() async {
    isLoading.value = true;
    await _matchesRepository.fetchReceivedIntresetProfiles().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        receivedInterestsProfiles.value = value.data;
        receivedInterestsProfiles.refresh();
      }
    });
  }

  Future<bool> updateIntereestStatus(
      MatchProfile profile, String status) async {
    return await _matchesRepository.updateInterestStatus(
        {"recipient_id": profile.profileId, "status": status}).then((value) {
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: Duration(seconds: 3),
          message: "Interest Status Updated !",
        ));
      } else {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: const Duration(seconds: 3),
          message: value.message ?? "Error Updating Interest Status !",
        ));
      }
      return value.status == Status.COMPLETED;
    });
  }

//SEARCH
  Rx<MatchProfile> searchProfile = MatchProfile().obs;
  ScrollController searchMatchesScrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt totalPage = 1.obs;
  RxBool showSearchResults = false.obs;
  RxList<MatchProfile> searchMacthes = <MatchProfile>[].obs;
  void searchMacthesById(bool reinit) async {
    List<MatchProfile> emptyList = [];
    if (reinit) {
      page.value = 1;
      totalPage.value = 1;
      searchMacthes.value = [];
    }
    isLoading.value = true;
    await _matchesRepository
        .searchProfilesById(searchProfile.value, page.value)
        .then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        totalPage.value = value.data["total_pages"] ?? 1;
        // ((value.data["count_total"] / value.data["count"]) as double).round();
        emptyList.addAll((value.data["profiles"] as List)
            .map((e) => MatchProfile.fromJson(e))
            .toList());
        if (reinit) {
          searchMacthes.value = emptyList;
        } else {
          isLoading.value = false;
          searchMacthes.addAll(emptyList);
        }
        searchMacthes.refresh();
      }
    });
  }

  Future<bool> chatProfile(MatchProfile profile, BuildContext context) async {
    return await _matchesRepository
        .sendChatRequest({"recipient_id": profile.profileId}).then((value) {
      if (value.status == Status.COMPLETED) {
        // Get.showSnackbar(const GetSnackBar(
        //   backgroundColor: ColorPallete.primary,
        //   duration: Duration(seconds: 3),
        //   message: "Interest Sent !",
        // ));
      } else {
        showErrorDialog(
          context,
          value.message ?? "Error Getting Contact !",
        );
      }
      return value.status == Status.COMPLETED;
    });
  }

  RxBool isCheckingCall = false.obs;
  RxBool isSendingIntrest = false.obs;
  RxBool isBloacking = false.obs;
  RxBool showContact = false.obs;
  RxBool isShowingContact = false.obs;

  Future<bool> contactProfile(
      MatchProfile profile, BuildContext context) async {
    return await _matchesRepository
        .sendContactRequest({"recipient_id": profile.profileId}).then((value) {
      isCheckingCall.value = false;
      isShowingContact.value = false;

      if (value.status == Status.COMPLETED) {
        // Get.showSnackbar(const GetSnackBar(
        //   backgroundColor: ColorPallete.primary,
        //   duration: Duration(seconds: 3),
        //   message: "Interest Sent !",
        // ));
      } else {
        showErrorDialog(
          context,
          value.message ?? "Error Contacting Profile !",
        );
      }
      return value.status == Status.COMPLETED;
    });
  }

  Future<bool> viewedProfile(MatchProfile profile, BuildContext context) async {
    return await _matchesRepository
        .sendViewProfileUpdate({"profile_id": profile.profileId}).then((value) {
      if (value.status == Status.COMPLETED) {
        // Get.showSnackbar(const GetSnackBar(
        //   backgroundColor: ColorPallete.primary,
        //   duration: Duration(seconds: 3),
        //   message: "Interest Sent !",
        // ));
      } else {
        showErrorDialog(
          context,
          value.message ?? "Error Viewing Profile !",
        );
      }
      return value.status == Status.COMPLETED;
    });
  }

  showErrorDialog(BuildContext context, String? message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: ColorPallete.theme,
          title: const TextView(
            text: "Error",
            color: ColorPallete.red,
            fontSize: 14,
            weight: FontWeight.bold,
          ),
          content: TextView(
            text: message ?? "Error Contacting Profile !",
            color: ColorPallete.secondary,
            fontSize: 14,
            weight: FontWeight.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: RoundedContainer(
                  radius: 0,
                  child: const TextView(
                    text: "OK",
                    fontSize: 14,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    if (message?.contains("plan") ?? false) {
                      Get.toNamed(Routes.PACKAGES);
                    }
                  }),
            ),
          ],
        );
      },
    );
  }
}
