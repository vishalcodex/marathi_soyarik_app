import 'package:marathi_soyarik/app/routes/app_routes.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils.dart';
import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';
import 'filter_screen.dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => closeAppAlert(context),
          child: Scaffold(
            key: controller.scaffoldKey,
            backgroundColor: ColorPallete.theme,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: ColorPallete.theme),
              backgroundColor: ColorPallete.primary,
              centerTitle: true,
              title: Obx(
                () => TextView(
                  text: controller.bottomTabs[controller.setTabIndex.value]
                      ["title"],
                  color: ColorPallete.theme,
                  fontSize: 18,
                  weight: FontWeight.bold,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () async {
                    Get.toNamed(Routes.INTERESTS);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                    child: Icon(
                      Icons.favorite,
                      color: ColorPallete.theme,
                      size: 25 * fem,
                    ),
                  ),
                )
              ],
            ),
            body: RoundedContainer(
              radius: 0,
              child: Obx(
                  () => controller.getTabScreen(controller.setTabIndex.value)),
            ),
            drawer: const CustomDrawer(),
            endDrawer: const FilterScreen(),
          ),
        ),
      ),
    );
  }
}
