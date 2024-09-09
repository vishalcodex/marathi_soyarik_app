import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';
import '../../home/controllers/home_controller.dart';

// ignore: must_be_immutable
class MyProfileScreen extends GetView<HomeController> {
  MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            title: const TextView(
              text: "My Profile",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  String getInitials(String name) {
    String initials = "";
    if (name != "") {
      var names = name.split(" ");
      int numWords = 2;
      if (numWords < names.length) {
        numWords = names.length;
      }
      for (var i = 0; i < numWords; i++) {
        initials += '${names[i][0]}';
      }
    }
    return initials;
  }
}
