import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/package_model.dart';
import '../controllers/settings_controller.dart';

class PackagesScreen extends GetView<SettingsController> {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    controller.fetchPackages();
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          // appBar: AppBar(
          //   iconTheme: const IconThemeData(color: ColorPallete.theme),
          //   backgroundColor: ColorPallete.primary,
          //   title: const TextView(
          //     text: "About Us",
          //     color: ColorPallete.theme,
          //     fontSize: 18,
          //     weight: FontWeight.bold,
          //   ),
          //   centerTitle: true,
          // ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              color: ColorPallete.primary,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/bg.jpeg",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
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
                                Color(0xff4d1d68).withOpacity(0.9),
                                Color(0xff4d1d68).withOpacity(0.9)
                              ],
                              stops: [0, 0.3, 1],
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: ColorPallete.theme,
                                        size: 25,
                                      ),
                                    ),
                                    const TextView(
                                      text: "Packages",
                                      color: ColorPallete.theme,
                                      fontSize: 20,
                                      weight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    )
                                  ],
                                ),
                              ),
                              const Expanded(child: SizedBox.shrink()),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => controller.packages.isNotEmpty &&
                                          controller.selectedPage.value != -1
                                      ? PageView.builder(
                                          pageSnapping: true,
                                          controller: PageController(
                                              initialPage: 1,
                                              viewportFraction: 0.75),
                                          itemCount: controller.packages.length,
                                          onPageChanged: (value) {
                                            controller.selectedPage.value =
                                                value;
                                            controller.selectedPage.refresh();
                                          },
                                          itemBuilder: (context, index) {
                                            bool selected =
                                                controller.selectedPage.value ==
                                                    index;
                                            Package package = controller
                                                .packages
                                                .elementAt(index);
                                            return Transform.scale(
                                              scale: selected ? 1 : 0.9,
                                              child:
                                                  _getPackage(context, package),
                                            );
                                          },
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ),
                              const Expanded(child: SizedBox.shrink())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPackage(BuildContext context, Package package) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
      child: RoundedContainer(
        radius: 10,
        height: 250,
        clip: Clip.antiAliasWithSaveLayer,
        color: ColorPallete.theme,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MyListView(
                  children: [
                    TextView(
                      text: "₹ ${package.packAmmount} /-",
                      fontSize: 16,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.right,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextView(
                      text: package.packName.toString(),
                      fontSize: 18,
                      color: ColorPallete.primary,
                      alignment: TextAlign.center,
                      weight: FontWeight.bold,
                    ),
                    // TextView(
                    //   text: "In Offer 2,700",
                    //   fontSize: 18,
                    //   color: ColorPallete.primary,
                    //   alignment: TextAlign.center,
                    //   weight: FontWeight.bold,
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    const TextView(
                      text: "Unlimited Profile Access",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.center,
                      weight: FontWeight.w500,
                    ),

                    TextView(
                      text: "Intrests : ${package.totalInterest}",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                    TextView(
                      text: "Chat Request : ${package.totalChat}",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                    TextView(
                      text: "Contact Views : ${package.totalContact} days",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                    TextView(
                      text: "Plan Duration :  ${package.duration} days",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.makePayment(context, package);
              },
              child: const RoundedContainer(
                radius: 0,
                color: ColorPallete.primary,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextView(
                      text: "Choose",
                      color: ColorPallete.theme,
                      fontSize: 14,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
