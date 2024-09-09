import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/mathc_profile_model.dart';
import '../../../models/profile_details_model.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/match_controller.dart';

// ignore: must_be_immutable
class ProfileDetailsScreen extends GetView<MatchController> {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    bool isMyProfile = Get.arguments?["myDetails"] ?? false;
    MatchProfile matchProfile = Get.arguments?["profile"] ?? MatchProfile();
    controller.fecthProfileDetails(matchProfile, isMyProfile);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Profile Details",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          if ((controller.selectedProfile.value.name ?? "") == "") {
            return const Loading();
          } else {
            ProfileDetails profile = controller.selectedProfile.value;
            return Column(
              children: [
                //PROFILE IMAGES
                Padding(
                  padding: EdgeInsets.all(10.0 * fem),
                  child: RoundedContainer(
                    radius: 10,
                    clip: Clip.antiAliasWithSaveLayer,
                    color: ColorPallete.primary.withOpacity(0.25),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SafeArea(
                                child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: PageView.builder(
                                        // itemCount: 4,
                                        itemBuilder: (context, index) {
                                          var img = (index % 4) == 0
                                              ? profile.photo1
                                              : index == 1
                                                  ? profile.photo2
                                                  : index == 2
                                                      ? profile.photo3
                                                      : profile.photo4;
                                          return Center(
                                            child: MyListView(
                                              children: [
                                                CachedNetworkImage(
                                                  key: Key(index.toString()),
                                                  imageUrl: Urls.getImageUrl(
                                                      img ?? ""),
                                                  placeholder: (context, url) {
                                                    return Image.asset(
                                                      "assets/ui/logo.png",
                                                      height: 200 * fem,
                                                    );
                                                  },
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) {
                                                    return Image.asset(
                                                      "assets/ui/logo.png",
                                                      height: 200 * fem,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20.0 * fem),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: ColorPallete.primary,
                                          radius: 20 * fem,
                                          child: Icon(
                                            Icons.close,
                                            size: 25 * fem,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                          },
                        ));
                      },
                      child: PageView.builder(
                        // itemCount: 4,
                        itemBuilder: (context, index) {
                          var img = (index % 4) == 0
                              ? profile.photo1
                              : index == 1
                                  ? profile.photo2
                                  : index == 2
                                      ? profile.photo3
                                      : profile.photo4;
                          return Center(
                            child: MyListView(
                              children: [
                                RoundedContainer(
                                  radius: 10,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  child: CachedNetworkImage(
                                    key: Key(index.toString()),
                                    imageUrl: Urls.getImageUrl(img ?? ""),
                                    placeholder: (context, url) {
                                      return Image.asset(
                                        "assets/ui/logo.png",
                                        height: 200 * fem,
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) {
                                      return Image.asset(
                                        "assets/ui/logo.png",
                                        height: 200 * fem,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      RoundedContainer(
                        radius: 0,
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5 * fem,
                            ),
                            Expanded(
                              child: MyListView(
                                scroll: true,
                                isRow: true,
                                children: controller.profileTabs.map((e) {
                                  bool selected =
                                      controller.selectedProfileTab ==
                                          e["name"];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0 * fem),
                                    child: InkWell(
                                      onTap: () {
                                        controller.selectedProfileTab.value =
                                            e["name"];
                                        controller.selectedProfileTab.refresh();
                                      },
                                      child: RoundedContainer(
                                        radius: 15,
                                        color: selected
                                            ? ColorPallete.primary
                                            : ColorPallete.theme,
                                        borderColor: ColorPallete.primary,
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15 * fem),
                                            child: TextView(
                                              text: e["name"],
                                              color: selected
                                                  ? ColorPallete.theme
                                                  : ColorPallete.primary,
                                              weight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: controller.getSelelectedTabView())
                    ],
                  ),
                ),
                Obx(
                  () => (!controller.isMyProfile.value)
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0 * fem, vertical: 0 * fem),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () async {
                                    controller.isCheckingCall.value = true;
                                    await controller
                                        .contactProfile(
                                            MatchProfile(profileId: profile.id),
                                            context)
                                        .then((value) {
                                      controller.isCheckingCall.value = false;
                                      if (value) {
                                        final Uri telLaunchUri = Uri(
                                          scheme: 'tel',
                                          path: "+91 ${profile.mobile}",
                                        );
                                        launchUrl(telLaunchUri);
                                      }
                                    });
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    height: 45,
                                    color: Colors.green,
                                    child: controller.isCheckingCall.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: ColorPallete.theme,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.all(10 * fem),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.call,
                                                  color: ColorPallete.theme,
                                                ),
                                                SizedBox(
                                                  width: 5 * fem,
                                                ),
                                                const TextView(
                                                  text: "Call",
                                                  color: ColorPallete.theme,
                                                  fontSize: 14,
                                                  weight: FontWeight.bold,
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5 * fem,
                              ),
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  onTap: () async {
                                    controller.isSendingIntrest.value = true;
                                    await controller
                                        .sendIntrestTo(
                                            MatchProfile(profileId: profile.id),
                                            context)
                                        .then((value) {
                                      controller.isSendingIntrest.value = false;
                                    });
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    height: 45,
                                    color: ColorPallete.primary,
                                    child: controller.isSendingIntrest.value
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: ColorPallete.theme,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.all(10 * fem),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.favorite,
                                                  color: ColorPallete.theme,
                                                ),
                                                SizedBox(
                                                  width: 5 * fem,
                                                ),
                                                const TextView(
                                                  text: "Send Request",
                                                  color: ColorPallete.theme,
                                                  fontSize: 14,
                                                  weight: FontWeight.bold,
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5 * fem,
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    controller.isBloacking.value = true;
                                    controller
                                        .updateBlockList(
                                            MatchProfile(profileId: profile.id),
                                            "block",
                                            context)
                                        .then((value) {
                                      controller.isBloacking.value = false;
                                    });
                                  },
                                  child: RoundedContainer(
                                    radius: 10,
                                    color: ColorPallete.red,
                                    child: Padding(
                                      padding: EdgeInsets.all(10 * fem),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.block,
                                            color: ColorPallete.theme,
                                          ),
                                          SizedBox(
                                            width: 5 * fem,
                                          ),
                                          const TextView(
                                            text: "Block",
                                            color: ColorPallete.theme,
                                            fontSize: 14,
                                            weight: FontWeight.bold,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
