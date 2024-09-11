import 'package:marathi_soyarik/app/models/mathc_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/tab_switcher.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/match_controller.dart';
import '../widgets/match_card_widget.dart';

// ignore: must_be_immutable
class InterestsScreen extends GetView<MatchController> {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.fetchSentInterestProfiles();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Interests",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: TabSwitcher(
                  tabs: [
                    {
                      "name": "Sent Interest",
                      "view": RefreshIndicator(
                        onRefresh: () {
                          controller.fetchSentInterestProfiles();
                          return Future.value();
                        },
                        child: MyListView(
                          scroll: true,
                          children: controller.isLoading.value
                              ? [const Loading()]
                              : controller.sentInterestsProfiles.isEmpty
                                  ? [
                                      SizedBox(
                                        height: 200 * fem,
                                        child: const Center(
                                            child: TextView(
                                          text: "No Profiles !",
                                          color: ColorPallete.grey,
                                          fontSize: 16,
                                        )),
                                      )
                                    ]
                                  : controller.sentInterestsProfiles
                                      .map((e) => MatchCardWidget(
                                            profile: e.profile!,
                                            view: "SENT_INTEREST",
                                            status: e.status,
                                          ))
                                      .toList(),
                        ),
                      ),
                    },
                    {
                      "name": "Recieved Interest",
                      "view": RefreshIndicator(
                        onRefresh: () {
                          controller.fetchReceivedInterestProfiles();
                          return Future.value();
                        },
                        child: MyListView(
                          scroll: true,
                          children: controller.isLoading.value
                              ? [const Loading()]
                              : controller.receivedInterestsProfiles.isEmpty
                                  ? [
                                      SizedBox(
                                        height: 200 * fem,
                                        child: const Center(
                                            child: TextView(
                                          text: "No Profiles !",
                                          color: ColorPallete.grey,
                                          fontSize: 16,
                                        )),
                                      )
                                    ]
                                  : controller.receivedInterestsProfiles
                                      .map((e) => MatchCardWidget(
                                            profile:
                                                e.profile ?? MatchProfile(),
                                            view: "RECEIVED_INTEREST",
                                            status: e.status,
                                            updateInterestStatus:
                                                (value) async {
                                              return controller
                                                  .updateIntereestStatus(
                                                      e.profile!, value)
                                                  .then((value) {
                                                return value;
                                              });
                                            },
                                          ))
                                      .toList(),
                        ),
                      ),
                    }
                  ],
                  onTabsChanged: (value) {
                    value == 0
                        ? controller.fetchSentInterestProfiles()
                        : controller.fetchReceivedInterestProfiles();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
