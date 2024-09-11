import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/image_input.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/sign_up_controller.dart';

// ignore: must_be_immutable
class UploadDocumentsScreen extends GetView<SignUpController> {
  const UploadDocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            // if (controller.selectedTile.value == 1) {
            //   return Future.value(true);
            // } else {
            //   controller.selectedTile.value = controller.selectedTile.value - 1;
            //   controller.selectedTile.refresh();
            // }
            return Future.value(true);
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
                                            "${controller.isAuthenticated.value ? "Update" : "Upload"} ID Proof",
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MyListView(
                        children: [
                          const TextView(
                            text:
                                "Please provide us your ID Proof for Authentication",
                            color: ColorPallete.secondary,
                            fontSize: 16,
                            weight: FontWeight.bold,
                            alignment: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30 * fem,
                          ),
                          const Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: TextView(
                              text:
                                  "Upload ID Proof (Prefferably Aadhaar Card)",
                              color: ColorPallete.primary,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          ImageInput(
                            callback: (img) {
                              controller.idProof.value = img;
                              controller.idProof.refresh();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorPallete.theme,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorPallete.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: controller.idProof.value != ""
                                  ? Center(
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 150,
                                        child: Image.network(
                                          Urls.getImageUrl(
                                              controller.idProof.value),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.file(
                                              File(controller.idProof.value),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const RoundedContainer(
                                      radius: 10,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 15),
                                        child: TextView(
                                          text: "Upload Proof",
                                          color: ColorPallete.grey,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: TextView(
                              text: "Upload Your Photo For Profile",
                              color: ColorPallete.primary,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          ImageInput(
                            callback: (img) {
                              controller.profilePic.value = img;
                              controller.profilePic.refresh();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorPallete.theme,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            ColorPallete.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: controller.profilePic.value != ""
                                  ? Center(
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 150,
                                        child: Image.network(
                                          controller.profilePic.value,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.file(
                                              File(controller.profilePic.value),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const RoundedContainer(
                                      radius: 10,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 15),
                                        child: TextView(
                                          text: "Upload Proof",
                                          color: ColorPallete.grey,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0 * fem),
                        child: InkWell(
                          onTap: () {
                            if (!controller.isLoading.value) {
                              controller.continueToPartnerPref(context);
                            }
                          },
                          child: RoundedContainer(
                            radius: 10,
                            height: 50,
                            color: ColorPallete.primary,
                            child: controller.isLoading.value
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0 * fem),
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: ColorPallete.theme,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15.0 * fem, horizontal: 20),
                                    child: const Center(
                                      child: TextView(
                                        text: "Upload",
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
