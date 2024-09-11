import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/master_data_model.dart' as md;
import '../../../models/mathc_profile_model.dart';
import '../../../models/partner_preference_model.dart';
import '../../../models/search_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/membership_repository.dart';
import '../../../repositories/settings_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class SignUpController extends GetxController {
  late MembershipRepository _membershipRepository;
  late SettingsRepository _settingsRepository;
  SignUpController() {
    _membershipRepository = MembershipRepository();
    _settingsRepository = SettingsRepository();
  }

  Rx<User> user = User().obs;

  @override
  void onInit() {
    super.onInit();

    user.value = Get.find<AuthService>().user.value;
    Get.find<AuthService>().user.listen((p0) {
      user.value = p0;
      user.refresh();
    });
    basicDetails.value = BasicDetails.fromJson(user.value.toJson());
    // selectedTile.listen((p0) {
    //   switch (p0) {
    //     case 2:
    //       fetchMpCommitees();
    //       break;
    //     case 3:
    //       fetchOccupationCategories();
    //       break;
    //     default:
    //   }
    // });

    searchMatchesScrollController.addListener(() {
      if (searchMatchesScrollController.position.pixels ==
              searchMatchesScrollController.position.maxScrollExtent &&
          page.value < totalPage.value) {
        page.value = page.value + 1;
        isLoading.value = true;
        Future.delayed(const Duration(milliseconds: 500), () {
          searchMatchesScrollController
              .jumpTo(searchMatchesScrollController.position.maxScrollExtent);
          getSearchMatches(false);
        });
      }
    });
    isAuthenticated.value = Get.arguments?["isLoggedIn"] ?? false;
    fetchData();
  }

  RxBool isAuthenticated = false.obs;
  RxInt selectedTile = 1.obs;

  RxString image = "".obs;
  Rx<BasicDetails> basicDetails = BasicDetails().obs;
  Rx<ReligiousDetails> religiousDetails = ReligiousDetails().obs;
  Rx<EducationDetails> educationDetails = EducationDetails().obs;
  Rx<LifestyleDetails> lifestyleDetails = LifestyleDetails().obs;
  Rx<LocationDetails> locationDetails = LocationDetails().obs;
  Rx<FamilyDetails> familyDetails = FamilyDetails().obs;

  List<String> profileLabels = [
    "Basic Details",
    "Religious Details",
    "Education Details",
    "Lifestyle Details",
    "Location Details",
    "Family Details",
  ];

  GlobalKey<FormState> basicDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> religiousDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> educationDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> lifestyleDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> familyDetailsFormKey = GlobalKey<FormState>();

  fetchData() async {
    await fetchBasicDetails();
    await fetchMotherTounges();
    await fetchCountries(true);
    await fetchCastes();
    await fetchEducationalOptions();
  }

  List<String> religions = [
    "Buddhist",
    "Christian",
    "Hindu",
    "Muslim",
    "Sikh",
    "Parsi",
    "Jain",
    "Jewish",
    "Bahai"
  ];
  List<String> religionsPref = [
    "Dose'nt Matter",
    "Buddhist",
    "Christian",
    "Hindu",
    "Muslim",
    "Sikh",
    "Parsi",
    "Jain",
    "Jewish",
    "Bahai"
  ];

  List<String> maritialStatuses = ["Single", "Married", "Divorced", "Widowed"];
  List<String> profileCreators = [
    "Self",
    "Parents",
    "Sister",
    "Brother",
    "Guardian"
  ];
  List<String> heights = [
    "4 ft",
    "4 ft 1 inches",
    "4 ft 2 inches",
    "4 ft 3 inches",
    "4 ft 4 inches",
    "4 ft 5 inches",
    "4 ft 6 inches",
    "4 ft 7 inches",
    "4 ft 8 inches",
    "4 ft 9 inches",
    "4 ft 10 inches",
    "4 ft 11 inches",
    "5 ft",
    "5 ft 1 inches",
    "5 ft 2 inches",
    "5 ft 3 inches",
    "5 ft 4 inches",
    "5 ft 5 inches",
    "5 ft 6 inches",
    "5 ft 7 inches",
    "5 ft 8 inches",
    "5 ft 9 inches",
    "5 ft 10 inches",
    "5 ft 11 inches",
    "6 ft",
    "6 ft 1 inches",
    "6 ft 2 inches",
    "6 ft 3 inches",
    "6 ft 4 inches",
    "6 ft 5 inches",
    "6 ft 6 inches",
    "6 ft 7 inches",
    "6 ft 8 inches",
    "6 ft 9 inches",
    "6 ft 10 inches",
    "6 ft 11 inches",
    "7 ft",
    "7 ft 1 inches",
    "7 ft 2 inches",
    "7 ft 3 inches",
    "7 ft 4 inches",
    "7 ft 5 inches",
  ];

  RxList<md.MotherTounge> mothertounges = <md.MotherTounge>[].obs;
  fetchMotherTounges() async {
    await _settingsRepository.fetchMotherToungesOptions().then((value) {
      if (value.status == Status.COMPLETED) {
        mothertounges.value = value.data;
        mothertounges.refresh();
      }
    });
  }

  List<String> bodyTypes = ["Slim", "Average", "Athletic", "Heavy"];
  List<String> skinTones = [
    "Fair",
    "Wheatish",
    "Very Fair",
    "Wheatish Brown",
    "Dark"
  ];
  List<String> skinTonesPref = [
    "Any",
    "Fair",
    "Wheatish",
    "Very Fair",
    "Wheatish Brown",
    "Dark"
  ];
  List<String> eatingHabits = [
    "Veg",
    "Non-veg",
    "Occasionally non-veg",
    "Eggatarian"
  ];

  List<String> drinkingHabits = ["Any", "Yes", "No"];

  RxList<md.Caste> castes = <md.Caste>[].obs;
  fetchCastes() async {
    await _settingsRepository.fetchCastes().then((value) {
      if (value.status == Status.COMPLETED) {
        castes.value = value.data;
        castes.refresh();
      }
    });
  }

  RxList<md.Education> educationalOptions = <md.Education>[].obs;
  fetchEducationalOptions() async {
    await _settingsRepository.fetchEductaionOptions().then((value) {
      if (value.status == Status.COMPLETED) {
        educationalOptions.value = value.data;
        educationalOptions.refresh();
      }
    });
  }

  RxList<md.Country> countries = <md.Country>[].obs;
  Rx<md.Country> selectedCountry = md.Country().obs;
  fetchCountries(bool isPref) async {
    countries.value = [];
    states.value = [];
    await _settingsRepository.fetchCountries().then((value) {
      if (value.status == Status.COMPLETED) {
        countries.value = value.data;
        countries.refresh();
        if (!isPref && locationDetails.value.country != null) {
          onCountryChanged(
              countries
                  .where((p0) =>
                      p0.id.toString() == locationDetails.value.country!)
                  .first
                  .name!,
              isPref);
        } else {
          if (locationPreference.value.country != null) {
            onCountryPrefChanged(
                countries
                    .where((p0) =>
                        p0.id.toString() == locationPreference.value.country!)
                    .first
                    .name!,
                isPref);
          }
        }
      }
    });
  }

  void onCountryChanged(String value, bool isPref) async {
    selectedCountry.value = countries.where((p0) => p0.name == value).first;
    locationDetails.value.country = selectedCountry.value.id.toString();
    // locationDetails.value.state = null;
    // locationDetails.value.city = null;
    await fetchStates(isPref);
  }

  RxList<md.State> states = <md.State>[].obs;
  Rx<md.State> selectedState = md.State().obs;
  fetchStates(bool isPref) async {
    states.value = [];
    cities.value = [];
    await _settingsRepository
        .fetchStatesByCountry(selectedCountry.value)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        states.value = value.data;
        states.refresh();
        if (!isPref && locationDetails.value.state != null) {
          onStateChanged(
              states
                  .where(
                      (p0) => p0.id.toString() == locationDetails.value.state!)
                  .first
                  .name!,
              isPref);
        } else {
          if (locationPreference.value.state != null) {
            onStatePrefChanged(
                states
                    .where((p0) =>
                        p0.id.toString() == locationPreference.value.state!)
                    .first
                    .name!,
                isPref);
          }
        }
      }
    });
  }

  void onStateChanged(String value, bool isPref) async {
    selectedState.value = states.where((p0) => p0.name == value).first;
    locationDetails.value.state = selectedState.value.id.toString();
    // locationDetails.value.city = null;
    await fetchCities(isPref);
  }

  RxList<md.City> cities = <md.City>[].obs;
  Rx<md.City> selectedCity = md.City().obs;
  fetchCities(bool isPref) async {
    cities.value = [];
    await _settingsRepository
        .fetchCitiesByState(selectedState.value)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // cities = <md.City>[].obs;
        cities.value = value.data;
        cities.refresh();
        if (!isPref && locationDetails.value.city != null) {
          onCityChanged(
              cities
                  .where((p0) => p0.id.toString() == locationDetails.value.city)
                  .first
                  .name!,
              isPref);
        } else {
          if (locationPreference.value.city != null) {
            onCityPrefChanged(
                cities
                    .where((p0) =>
                        p0.id.toString() == locationPreference.value.city!)
                    .first
                    .name!,
                isPref);
          }
        }
      }
    });
  }

  void onCityChanged(String value, bool isPref) async {
    selectedCity.value = cities.where((p0) => p0.name == value).first;
    locationDetails.value.city = selectedCity.value.id.toString();
    locationDetails.refresh();
  }

  fetchBasicDetails() async {
    await _membershipRepository
        .fetchBasicDetails({"id": user.value.userId}).then((value) {
      basicDetails.value = value.data;
      basicDetails.refresh();
    });
  }

  RxBool isLoading = false.obs;
  void validateAndContinue(context) async {
    // selectedTile.value = 6;
    GlobalKey<FormState> key = selectedTile.value == 1
        ? basicDetailsFormKey
        : selectedTile.value == 2
            ? religiousDetailsFormKey
            : selectedTile.value == 3
                ? educationDetailsFormKey
                : selectedTile.value == 4
                    ? lifestyleDetailsFormKey
                    : selectedTile.value == 5
                        ? locationDetailsFormKey
                        : familyDetailsFormKey;
    if (key.currentState!.validate()) {
      var result = false;
      isLoading.value = true;
      switch (selectedTile.value) {
        case 1:
          basicDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveBasicDetails(
                basicDetails.value.toJson(),
              )
              .then((value) => value.data);
          if (result) {
            religiousDetails.value = await _membershipRepository
                .fetchReligiousDetails({"id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 2:
          religiousDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveReligiousDetails(religiousDetails.value.toJson())
              .then((value) => value.data);
          if (result) {
            educationDetails.value = await _membershipRepository
                .fetchEducationDetails({"id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 3:
          educationDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveEducationDetails(educationDetails.value.toJson())
              .then((value) => value.data);
          if (result) {
            lifestyleDetails.value = await _membershipRepository
                .fetchLifestyleDetails({"id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 4:
          lifestyleDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveLifestyleDetails(lifestyleDetails.value.toJson())
              .then((value) => value.data);
          if (result) {
            locationDetails.value = await _membershipRepository
                .fetchLocationDetails({"id": user.value.userId}).then(
                    (value) => value.data);

            if ((locationDetails.value.country ?? "") != "") {
              onCountryChanged(
                  countries
                      .where((p0) =>
                          p0.id.toString() == locationDetails.value.country)
                      .first
                      .name!,
                  false);
            }
          }
          break;
        case 5:
          locationDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveLocationDetails(locationDetails.value.toJson())
              .then((value) => value.data);
          if (result) {
            familyDetails.value = await _membershipRepository
                .fetchFamilyDetails({"id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 6:
          familyDetails.value.id = user.value.userId;
          result = await _membershipRepository
              .saveFamilyDetails(familyDetails.value.toJson())
              .then((value) => value.data);
          break;
        default:
          result = false;
      }
      isLoading.value = false;
      if (result) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: const Duration(seconds: 2),
          message:
              "Details ${isAuthenticated.value ? "Updated" : "Submitted"} Successfully !!",
        ));

        if (selectedTile.value == 6) {
          fetchUploadData();
          if (!isAuthenticated.value) {
            Future.delayed(const Duration(seconds: 2), () {
              Get.toNamed(Routes.UPLOAD_DOCS);
            });
          } else {
            Future.delayed(const Duration(seconds: 1), () {
              Get.toNamed(Routes.UPLOAD_DOCS);
            });
          }
        }
        selectedTile.value = selectedTile.value + 1 > profileLabels.length
            ? profileLabels.length
            : selectedTile.value + 1;
        selectedTile.refresh();
      } else {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: Duration(seconds: 2),
          message: "Error Occured while Updating Details !",
        ));
      }
    }
  }

  RxString idProof = "".obs;
  RxString profilePic = "".obs;

  fetchUploadData() async {
    await _membershipRepository
        .fetchUploadData({"id": user.value.userId}).then((value) {
      // if (value.status == Status.COMPLETED) {
      idProof.value = value.data["idProof"];
      profilePic.value = value.data["profilePic"][0];
      idProof.refresh();
      profilePic.refresh();
      // }
    });
  }

  void continueToPartnerPref(context) async {
    isLoading.value = true;
    await _membershipRepository.saveIdProofNProfile({
      "id_proof": idProof.value,
      "profile_pic": profilePic.value,
      "id": user.value.userId
    }).then((value) async {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        await fetchBasicPreference();
        Get.toNamed(Routes.PARTNER_PREFERENCE);
      }
    });
  }

  Rx<BasicPreference> basicPreference = BasicPreference().obs;
  Rx<ReligiousPreference> religiousPreference = ReligiousPreference().obs;
  Rx<EducationPreference> educationPreference = EducationPreference().obs;
  Rx<LocationPreference> locationPreference = LocationPreference().obs;

  List<String> preferenceLabels = [
    "Basic Preference",
    "Religious Preference",
    "Location Preference",
    "Education & Occupation",
  ];

  GlobalKey<FormState> basicPreferenceFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> religiousPreferenceFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> educationPreferenceFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationPreferenceFormKey = GlobalKey<FormState>();

  RxInt selectedPreferenceTile = 1.obs;

  List<String> annualIncome = [
    "Any",
    "Below 1 lacs",
    "1 lacs to 2 lacs",
    "2 lacs to 3 lacs",
    "3 lacs to 4 lacs",
    "4 lacs to 5 lacs ",
    "5 lacs to 6 lacs",
    "6 lacs to 7 lacs",
    "7 lacs to 8 lacs",
    "9 lacs to 10 lacs",
    "10 lacs to 11 lacs",
    "11 lacs to 12 lacs",
    "12 lacs to 15 lacs",
    "15 lacs to 20 lacs",
    "20 lacs to 15 lacs",
    "25 lacs to 30 lacs",
    "30 lacs to 35 lacs",
    "35 lacs to 40 lacs",
    "40 lacs to 45 lacs",
    "45 lacs to 50 lacs",
    "50 lacs to 55 lacs",
    "55 lacs to 60 lacs",
    "60 lacs to 65 lacs",
    "65 lacs to 70 lacs",
    "70 lacs to 75 lacs",
    "75 lacs to 80 lacs",
    "80 lacs to 85 lacs",
    "85 lacs to 90 lacs",
    "90 lacs to 95 lacs",
    "95 lacs to 1 Cr",
    "Above 1 Cr"
  ];
  void onCountryPrefChanged(String value, bool isPref) async {
    selectedCountry.value = countries.where((p0) => p0.name == value).first;
    locationPreference.value.country = selectedCountry.value.id.toString();
    // locationPreference.value.state = null;
    // locationPreference.value.city = null;
    await fetchStates(isPref);
  }

  void onStatePrefChanged(String value, bool isPref) async {
    selectedState.value = states.where((p0) => p0.name == value).first;
    locationPreference.value.state = selectedState.value.id.toString();
    // locationPreference.value.city = null;
    await fetchCities(isPref);
  }

  void onCityPrefChanged(String value, bool isPref) async {
    selectedCity.value = cities.where((p0) => p0.name == value).first;
    locationPreference.value.city = selectedCity.value.id.toString();
    locationPreference.refresh();
  }

  fetchBasicPreference() async {
    await _membershipRepository
        .fetchBasicPreference({"v_id": user.value.userId}).then((value) {
      basicPreference.value = value.data;
    });
  }

  void validateAndContinue2(context) async {
    // selectedPreferenceTile.value = 4;
    GlobalKey<FormState> key = selectedPreferenceTile.value == 1
        ? basicPreferenceFormKey
        : selectedPreferenceTile.value == 2
            ? religiousPreferenceFormKey
            : selectedPreferenceTile.value == 3
                ? locationPreferenceFormKey
                : educationPreferenceFormKey;
    if (key.currentState!.validate()) {
      var result = false;
      isLoading.value = true;
      switch (selectedPreferenceTile.value) {
        case 1:
          basicPreference.value.vId = user.value.userId;
          result = await _membershipRepository
              .saveBasicPreference(
                basicPreference.toJson(),
              )
              .then((value) => value.data);
          if (result) {
            religiousPreference.value = await _membershipRepository
                .fetchReligiousPreference({"v_id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 2:
          religiousPreference.value.vId = user.value.userId;
          result = await _membershipRepository
              .saveReligiousPreference(religiousPreference.toJson())
              .then((value) => value.data);
          if (result) {
            locationPreference.value = await _membershipRepository
                .fetchLocationPreference({"v_id": user.value.userId}).then(
                    (value) => value.data);

            if ((locationPreference.value.country ?? "") != "") {
              onCountryPrefChanged(
                  countries
                      .where((p0) =>
                          p0.id.toString() == locationPreference.value.country!)
                      .first
                      .name!,
                  true);
            }
          }
          break;
        case 3:
          locationPreference.value.vId = user.value.userId;
          result = await _membershipRepository
              .saveLocationPreference(locationPreference.toJson())
              .then((value) => value.data);
          if (result) {
            educationPreference.value = await _membershipRepository
                .fetchEducationPreference({"v_id": user.value.userId}).then(
                    (value) => value.data);
          }
          break;
        case 4:
          educationPreference.value.vId = user.value.userId;
          result = await _membershipRepository
              .saveEducationPreference(educationPreference.toJson())
              .then((value) => value.data);
          break;
        default:
          result = false;
      }
      isLoading.value = false;
      if (result) {
        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorPallete.primary,
          duration: const Duration(seconds: 2),
          message:
              "Details ${isAuthenticated.value ? "Updated" : "Submitted"} Successfully !!",
        ));

        if (selectedPreferenceTile.value == 4) {
          if (!isAuthenticated.value) {
            Get.showSnackbar(
              const GetSnackBar(
                duration: Duration(seconds: 3),
                message: "Seting Up App ..\nAnd Going to Home Screen",
              ),
            );
            Future.delayed(const Duration(seconds: 1), () {
              Get.offAllNamed(
                Routes.HOME,
                predicate: (route) => Get.currentRoute == "/home",
              );
              // paymentGateway(context).then((value) {});
            });
          } else {
            Future.delayed(const Duration(seconds: 1), () {
              Get.offAllNamed(
                Routes.HOME,
                predicate: (route) => Get.currentRoute == "/home",
              );
              // paymentGateway(context).then((value) {});
            });
          }
        }
        selectedPreferenceTile.value =
            selectedPreferenceTile.value + 1 > preferenceLabels.length
                ? preferenceLabels.length
                : selectedPreferenceTile.value + 1;
        selectedPreferenceTile.refresh();
      } else {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: ColorPallete.red,
          duration: Duration(seconds: 2),
          message: "Error Occured while Updating Details !",
        ));
      }
    }
  }

//SEARCH
  Rx<Search> searchProfile = Search().obs;
  ScrollController searchMatchesScrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt totalPage = 1.obs;
  RxBool showSearchResults = false.obs;
  RxList<MatchProfile> searchMacthes = <MatchProfile>[].obs;
  void getSearchMatches(bool reinit) async {
    List<MatchProfile> emptyList = [];
    if (reinit) {
      page.value = 1;
      totalPage.value = 1;
      searchMacthes.value = [];
    }
    isLoading.value = true;
    showSearchResults.value = true;
    await _settingsRepository
        .searchProfiles(searchProfile.value, page.value)
        .then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        totalPage.value = (value.data["total_pages"] ?? "") == ""
            ? 1
            : value.data["total_pages"];
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
}
