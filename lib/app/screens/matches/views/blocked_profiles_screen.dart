import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/match_controller.dart';
import '../widgets/match_card_widget.dart';

// ignore: must_be_immutable
class BlockedProfilesScreen extends GetView<MatchController> {
  const BlockedProfilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.fetchBlockedProfiles();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Blocked Profiles",
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
                  controller.fetchBlockedProfiles();
                  return Future.value();
                },
                child: MyListView(
                  scroll: true,
                  children: controller.isLoading.value
                      ? [const Loading()]
                      : controller.blockedProfiles.isEmpty
                          ? [
                              SizedBox(
                                height: 200 * fem,
                                child: const Center(
                                    child: TextView(
                                  text: "No Blocked Profiles !",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                )),
                              )
                            ]
                          : controller.blockedProfiles
                              .map((e) => MatchCardWidget(
                                    profile: e,
                                    view: "BLOCKED",
                                    unblockProfile: () {
                                      return controller
                                          .updateBlockList(
                                              e, "unblock", context)
                                          .then((value) {
                                        value == true
                                            ? controller.blockedProfiles
                                                .remove(e)
                                            : () {};
                                        return value;
                                      });
                                    },
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
