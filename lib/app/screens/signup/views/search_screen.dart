import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/search_model.dart';
import '../../matches/controllers/match_controller.dart';
import '../../matches/widgets/match_card_widget.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/form_fields.dart';

// ignore: must_be_immutable
class SearchScreen extends GetView<SignUpController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Search",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            if (controller.showSearchResults.value) {
              controller.searchProfile.value = Search();
              controller.showSearchResults.value = false;
            } else {
              Get.back();
            }
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorPallete.theme,
          ),
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (controller.showSearchResults.value) {
              controller.searchProfile.value = Search();
              controller.showSearchResults.value = false;
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: Obx(
            () => Column(
              children: [
                controller.showSearchResults.value
                    ? Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            controller.getSearchMatches(true);
                            return Future.value(true);
                          },
                          child: MyListView(
                            controller:
                                controller.searchMatchesScrollController,
                            scroll: true,
                            children: [
                              controller.searchMacthes.isEmpty &&
                                      !controller.isLoading.value
                                  ? SizedBox(
                                      height: 200 * fem,
                                      child: const Center(
                                        child: TextView(
                                          text: "No More Macthes !",
                                          color: ColorPallete.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  : MyListView(
                                      children: controller.searchMacthes
                                          .map(
                                            (e) => MatchCardWidget(
                                              profile: e,
                                              sendInterest: () async {
                                                return await Get.find<
                                                        MatchController>()
                                                    .sendIntrestTo(e, context)
                                                    .then(
                                                  (value) {
                                                    value == true
                                                        ? controller
                                                            .searchMacthes
                                                            .remove(e)
                                                        : () {};
                                                    return value;
                                                  },
                                                );
                                              },
                                              addToShortlist: () async {
                                                return await Get.find<
                                                        MatchController>()
                                                    .addToShorlist(e)
                                                    .then((value) {
                                                  value == true
                                                      ? controller.searchMacthes
                                                          .remove(e)
                                                      : () {};
                                                  return value;
                                                });
                                              },
                                            ),
                                          )
                                          .toList(),
                                    ),
                              if (controller.isLoading.value) const Loading()
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: MyListView(
                                scroll: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0 * fem),
                                    child: MyListView(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const TextView(
                                          text: "ID",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        MyFormField(
                                          fieldName: "ID",
                                          showFieldName: false,
                                          type: InputType.TEXT,
                                          keyboard: TextInputType.text,
                                          required: true,
                                          initialValue: "",
                                          onChanged: (value) {
                                            controller.searchProfile.value.id =
                                                value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Religion",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        MyFormField(
                                          fieldName: "Religion",
                                          showFieldName: false,
                                          type: InputType.DROP_DOWN,
                                          keyboard: TextInputType.text,
                                          dropDownOptions: controller.religions,
                                          required: true,
                                          initialValue: "",
                                          onChanged: (value) {
                                            controller.searchProfile.value
                                                .religion = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Maritial Status",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        MyFormField(
                                          fieldName: "Maritial Status",
                                          showFieldName: false,
                                          type: InputType.DROP_DOWN,
                                          keyboard: TextInputType.text,
                                          dropDownOptions:
                                              controller.maritialStatuses,
                                          required: true,
                                          initialValue: "",
                                          onChanged: (value) {
                                            controller.searchProfile.value
                                                .maritalStatus = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Mother Tounge",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        MyFormField(
                                          fieldName: "Mother Tounge",
                                          showFieldName: false,
                                          type: InputType.DROP_DOWN,
                                          keyboard: TextInputType.text,
                                          dropDownOptions: controller
                                              .mothertounges
                                              .map((element) => element.name)
                                              .toList(),
                                          required: true,
                                          initialValue: "",
                                          onChanged: (value) {
                                            controller.searchProfile.value
                                                .motherTongue = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Age",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MyFormField(
                                                fieldName: "Age From",
                                                showFieldName: false,
                                                type: InputType.DROP_DOWN,
                                                keyboard: TextInputType.name,
                                                // required: true,
                                                dropDownOptions: List.generate(
                                                    47,
                                                    (index) => "${18 + index}"),
                                                // initialValue: controller.personalDetails["dob"],
                                                onChanged: (value) {
                                                  controller.searchProfile.value
                                                      .ageFrom = value;
                                                },
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: TextView(
                                                text: "to",
                                                fontSize: 14,
                                                color: ColorPallete.primary,
                                              ),
                                            ),
                                            Expanded(
                                              child: MyFormField(
                                                fieldName: "Age to",
                                                showFieldName: false,
                                                type: InputType.DROP_DOWN,
                                                keyboard: TextInputType.name,
                                                // required: true,
                                                dropDownOptions: List.generate(
                                                    47,
                                                    (index) => "${18 + index}"),
                                                // initialValue: controller.personalDetails["dob"],
                                                onChanged: (value) {
                                                  controller.searchProfile.value
                                                      .ageTo = value;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Height",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: MyFormField(
                                                fieldName: "Height From",
                                                showFieldName: false,
                                                type: InputType.DROP_DOWN,
                                                keyboard: TextInputType.name,
                                                // required: true,
                                                dropDownOptions:
                                                    controller.heights,
                                                // initialValue: controller.personalDetails["dob"],
                                                onChanged: (value) {
                                                  controller.searchProfile.value
                                                      .heightFrom = value;
                                                },
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: TextView(
                                                text: "to",
                                                fontSize: 14,
                                                color: ColorPallete.primary,
                                              ),
                                            ),
                                            Expanded(
                                              child: MyFormField(
                                                fieldName: "Height to",
                                                showFieldName: false,
                                                type: InputType.DROP_DOWN,
                                                keyboard: TextInputType.name,
                                                // required: true,
                                                dropDownOptions:
                                                    controller.heights,
                                                // initialValue: controller.personalDetails["dob"],
                                                onChanged: (value) {
                                                  controller.searchProfile.value
                                                      .heightTo = value;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const TextView(
                                          text: "Education",
                                          fontSize: 16,
                                          color: ColorPallete.primary,
                                        ),
                                        MyFormField(
                                          fieldName: "Education",
                                          showFieldName: false,
                                          type: InputType.DROP_DOWN,
                                          dropDownOptions: controller
                                              .educationalOptions
                                              .map(
                                                  (element) => element.category)
                                              .toList(),
                                          keyboard: TextInputType.text,
                                          required: true,
                                          // initialValue: "",
                                          onChanged: (value) {
                                            controller.searchProfile.value
                                                .education = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // const TextView(
                                        //   text: "Annual Incomne",
                                        //   fontSize: 16,
                                        //   color: ColorPallete.primary,
                                        // ),
                                        // MyFormField(
                                        //   fieldName: "Annual Incomne",
                                        //   showFieldName: false,
                                        //   type: InputType.DROP_DOWN,
                                        //   keyboard: TextInputType.text,
                                        //   dropDownOptions:
                                        //       controller.annualIncome,
                                        //   required: true,
                                        //   initialValue: "",
                                        //   onChanged: (value) {},
                                        // ),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RoundedContainer(
                                radius: 0,
                                height: 40,
                                child: InkWell(
                                  onTap: () {
                                    controller.getSearchMatches(true);
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    height: 45,
                                    color: ColorPallete.primary,
                                    borderColor: ColorPallete.primary,
                                    child: controller.isLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: ColorPallete.theme,
                                            ),
                                          )
                                        : const Center(
                                            child: TextView(
                                              text: "Search",
                                              color: ColorPallete.theme,
                                              weight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
