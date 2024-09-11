import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../signup/widgets/form_fields.dart';
import '../controller/auth_controller.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Container(
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
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            color: ColorPallete.theme,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          TextView(
                                            text: "Login",
                                            color: ColorPallete.theme,
                                            fontSize: 16,
                                            weight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Expanded(
                                  child: RoundedContainer(
                                    radius: 0,
                                    child: Center(
                                      child: TextView(
                                        text: "SIGN UP",
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyListView(
                        scroll: true,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              // const Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 5.0),
                              //   child: TextView(
                              //     text: "CREATE PROFILE FOR",
                              //     color: ColorPallete.secondary,
                              //   ),
                              // ),
                              // MyFormField(
                              //   fieldName: "",
                              //   showFieldName: false,
                              //   type: InputType.DROP_DOWN,
                              //   dropDownOptions: ["Son", "Daughter", "Myself"],
                              //   keyboard: TextInputType.text,
                              //   onChanged: (value) {},
                              // ),
                              // const SizedBox(
                              //   height: 7.5,
                              // ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "VAR / VADHU NAME",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Enter Var/Vadhu Name",
                                initialValue: controller.user.value.name,
                                showFieldName: false,
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.user.value.name = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: TextView(
                                  text: "GENDER",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: ["Male", "Female"].map((e) {
                                      bool selected =
                                          (controller.isMale.value &&
                                                  e == "Male") ||
                                              (!controller.isMale.value &&
                                                  e == "Female");
                                      return Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            color: ColorPallete.theme,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.4),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 2))
                                            ]),
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.isMale.value &&
                                                e == "Female") {
                                              controller.isMale.value = false;
                                              controller.user.value.gender =
                                                  "Female";
                                            } else if (!controller
                                                    .isMale.value &&
                                                e == "Male") {
                                              controller.isMale.value = true;
                                              controller.user.value.gender =
                                                  "Male";
                                            }
                                            controller.isMale.refresh();
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            width: 100,
                                            color: ColorPallete.theme,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    selected
                                                        ? Icons
                                                            .radio_button_checked
                                                        : Icons
                                                            .radio_button_off,
                                                    color: selected
                                                        ? ColorPallete.primary
                                                        : ColorPallete.grey,
                                                  ),
                                                  Expanded(
                                                      child: Center(
                                                          child: TextView(
                                                    text: e,
                                                    fontSize: 14,
                                                    color: selected
                                                        ? ColorPallete.primary
                                                        : ColorPallete.grey,
                                                    weight: FontWeight.bold,
                                                  )))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "Date Of Birth",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "DOB",
                                initialValue: controller.user.value.dOB == null
                                    ? null
                                    : DateFormat("dd-MM-yyyy").format(
                                        DateFormat("yyyy-MM-dd").parse(
                                            controller.user.value.dOB
                                                .toString())),
                                showFieldName: false,
                                type: InputType.DATE,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.user.value.dOB =
                                      DateFormat("yyyy-MM-dd").format(
                                          DateFormat("dd-MM-yyyy")
                                              .parse(value));
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "MARITIAL STATUS",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Maritial Status",
                                initialValue:
                                    controller.user.value.maritalStatus,
                                showFieldName: false,
                                type: InputType.DROP_DOWN,
                                keyboard: TextInputType.text,
                                dropDownOptions: const [
                                  "Never Married",
                                  "Divorced",
                                  "Widow",
                                  "Widower"
                                ],
                                onChanged: (value) {
                                  controller.user.value.maritalStatus = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "LOCATION",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Enter Candidate Location",
                                initialValue: controller.user.value.location,
                                showFieldName: false,
                                type: InputType.DROP_DOWN,
                                dropDownOptions: controller.locations,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.user.value.location = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "MOBILE NO.",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Enter Candidate's Mobile Number",
                                initialValue: controller.user.value.mobile,
                                showFieldName: false,
                                type: InputType.TEXT,
                                keyboard: TextInputType.phone,
                                onChanged: (value) {
                                  controller.user.value.mobile = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "EMAIL",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Enter Candidate Email",
                                initialValue: controller.user.value.email,
                                showFieldName: false,
                                type: InputType.TEXT,
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.user.value.email = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "CREATE PASSWORD",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Password",
                                showFieldName: false,
                                type: InputType.TEXT,
                                keyboard: TextInputType.visiblePassword,
                                onChanged: (value) {
                                  controller.user.value.password = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "RELIGION",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              MyFormField(
                                fieldName: "Enter Candidate's Religion",
                                initialValue: controller.user.value.religion,
                                showFieldName: false,
                                type: InputType.DROP_DOWN,
                                dropDownOptions: const [
                                  "Buddhist",
                                  "Christian",
                                  "Hindu",
                                  "Muslim",
                                  "Sikh",
                                  "Parsi",
                                  "Jain",
                                  "Jewish",
                                  "Bahai"
                                ],
                                keyboard: TextInputType.text,
                                onChanged: (value) {
                                  controller.user.value.religion = value;
                                },
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              const Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "CASTE",
                                  color: ColorPallete.secondary,
                                ),
                              ),
                              Obx(
                                () => MyFormField(
                                  fieldName: "Enter Candidate's Caste",
                                  initialValue: controller.user.value.caste,
                                  showFieldName: false,
                                  type: InputType.DROP_DOWN,
                                  dropDownOptions: controller.castes
                                      .map((element) => element.name)
                                      .toList(),
                                  keyboard: TextInputType.text,
                                  onChanged: (value) {
                                    controller.user.value.caste = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 7.5,
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (!controller.isLoading.value) {
                                          controller.toSetupAccount();
                                        }
                                      },
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 45,
                                        color: Colors.green,
                                        child: controller.isLoading.value
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15 * fem),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: ColorPallete.theme,
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25.0 * fem,
                                                    vertical: 15 * fem),
                                                child: const TextView(
                                                  text: "Create Profile",
                                                  color: ColorPallete.theme,
                                                  weight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7.5,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
