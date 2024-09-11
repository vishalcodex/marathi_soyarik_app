import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/match_controller.dart';
import '../widgets/match_card_widget.dart';

// ignore: must_be_immutable
class ProfileVisitorScreen extends GetView<MatchController> {
  const ProfileVisitorScreen({Key? key}) : super(key: key);

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
          text: "Profile Visitiors",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Obx(
              () => RefreshIndicator(
                onRefresh: () {
                  controller.fetchViewedMyProfiles();
                  return Future.value();
                },
                child: MyListView(
                  scroll: true,
                  children: controller.isLoading.value
                      ? [const Loading()]
                      : controller.viewedMyProfiles.isEmpty
                          ? [
                              SizedBox(
                                height: 200 * fem,
                                child: const Center(
                                    child: TextView(
                                  text: "No Visitors !",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                )),
                              )
                            ]
                          : controller.viewedMyProfiles
                              .map((e) => MatchCardWidget(
                                    profile: e,
                                  ))
                              .toList(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
