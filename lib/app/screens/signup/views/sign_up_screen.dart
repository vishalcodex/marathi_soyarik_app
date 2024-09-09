import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/profile/family_details_form.dart';
import '../widgets/profile/lifestyle_details_form.dart';
import '../widgets/profile/location_details_form.dart';
import '../widgets/profile/religious_information_form.dart';
import '../widgets/profile/basic_details_form.dart';
import '../widgets/profile/education_details_form.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/sign_up_controller.dart';

// ignore: must_be_immutable
class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // controller.fetchData();
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (controller.selectedTile.value == 1) {
              return Future.value(true);
            } else {
              controller.selectedTile.value = controller.selectedTile.value - 1;
              controller.selectedTile.refresh();
            }
            return Future.value(false);
          },
          child: Obx(
            () => Container(
              color: ColorPallete.theme,
              child: Column(
                children: [
                  RoundedContainer(
                    radius: 0,
                    height: 120,
                    color: ColorPallete.primary,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/bg.jpeg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorPallete.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 10,
                            //   )
                            // ],
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffe92054).withOpacity(0.6),
                                Color(0xffe92054).withOpacity(0.8),
                              ],
                              stops: [0, 0.5],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: RoundedContainer(
                                    radius: 0,
                                    child: Center(
                                      child: TextView(
                                        text:
                                            "${controller.isAuthenticated.value ? "UPDATE" : "SETUP"} PROFILE",
                                        color: ColorPallete.theme,
                                        fontSize: 22,
                                        weight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20 * fem,
                  ),

                  // MyStepper(
                  //     currentStep: controller.selectedTile.value - 1,
                  //     labels: controller.stepsLabel),
                  Expanded(
                    child: controller.selectedTile.value == 1
                        ? const PersonalDetailsForm()
                        : controller.selectedTile.value == 2
                            ? const ReligiousInformationForm()
                            : controller.selectedTile.value == 3
                                ? const EducationDetailsForm()
                                : controller.selectedTile.value == 4
                                    ? const LifestyleDetailsForm()
                                    : controller.selectedTile.value == 5
                                        ? const LocationDetailsForm()
                                        : const FamilyDetailsForm(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [TextView(text: "* All fields are mandatory")],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.selectedTile.value > 1
                          ? Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: InkWell(
                                onTap: () {
                                  // if (!controller.isLoading.value) {
                                  controller.selectedTile.value =
                                      controller.selectedTile.value - 1;
                                  controller.isLoading.value = false;
                                  controller.isLoading.refresh();
                                  controller.selectedTile.refresh();
                                  // }
                                },
                                child: RoundedContainer(
                                  radius: 10,
                                  height: 50,
                                  color: ColorPallete.primary,
                                  child:
                                      // controller.isLoading.value
                                      //     ? const Center(
                                      //         child: CircularProgressIndicator(
                                      //           color: ColorPallete.theme,
                                      //         ),
                                      //       )
                                      //     :
                                      Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0 * fem, horizontal: 20),
                                    child: const Center(
                                      child: TextView(
                                        text: "Previous",
                                        color: ColorPallete.theme,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: EdgeInsets.all(10.0 * fem),
                        child: InkWell(
                          onTap: () {
                            if (!controller.isLoading.value) {
                              controller.validateAndContinue(context);
                            }
                          },
                          child: RoundedContainer(
                            radius: 10,
                            height: 50,
                            color: ColorPallete.primary,
                            child: controller.isLoading.value
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0 * fem),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0 * fem, horizontal: 20),
                                    child: Center(
                                      child: TextView(
                                        text: controller.selectedTile.value > 5
                                            ? "Submit"
                                            : "Next",
                                        color: ColorPallete.theme,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
