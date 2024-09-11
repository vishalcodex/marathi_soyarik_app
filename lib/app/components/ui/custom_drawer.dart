import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../common/color_pallete.dart';
import '../../models/mathc_profile_model.dart';
import '../../providers/api_endpoints.dart';
import '../../routes/app_routes.dart';
import '../../screens/home/controllers/home_controller.dart';
import '../../screens/settings/controllers/settings_controller.dart';
import 'my_list_view.dart';
import 'rounded_container.dart';
import 'text_view.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
      decoration: const BoxDecoration(
        color: ColorPallete.accent,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30 * fem),
        //     bottomLeft: Radius.circular(30 * fem)),
      ),
      height: double.infinity,
      width: baseWidth * 0.75 * fem,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User
            Container(
              color: ColorPallete.primary,
              child: MyListView(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: 5 * fem, horizontal: 15 * fem),
                  //   child: Row(
                  //     children: [
                  //       const Spacer(),
                  //       InkWell(
                  //         onTap: () {
                  //           Get.back();
                  //         },
                  //         child: Padding(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 5.0 * fem, vertical: 2.5 * fem),
                  //           child: Icon(
                  //             Icons.close,
                  //             color: ColorPallete.theme,
                  //             size: 25 * fem,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 20 * fem,
                  ),
                  InkWell(
                    onTap: () async {
                      // await Get.find<MatchController>().fecthProfileDetails(
                      //     MatchProfile(
                      //         profileId: controller.user.value.userId));
                      Get.toNamed(Routes.PROFILE_DETAILS, arguments: {
                        "myDetails": true,
                        "profile": MatchProfile(
                            profileId: controller.user.value.userId)
                      });
                    },
                    child: MyListView(
                      children: [
                        // Image.asset(
                        //   "assets/ui/logo.png",
                        //   height: 100 * fem,
                        // ),
                        Center(
                          child: RoundedContainer(
                            radius: 100,
                            height: 100 * fem,
                            width: 100 * fem,
                            clip: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: Urls.getImageUrl(
                                  controller.user.value.profileImg ?? ""),
                              fit: BoxFit.fill,
                              errorWidget: (context, url, error) {
                                return Image.asset(
                                  "assets/ui/logo.png",
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        TextView(
                          text: (controller.user.value.name ?? "") == ""
                              ? "Omkar Mhatre"
                              : controller.user.value.name.toString(),
                          color: ColorPallete.theme,
                          fontSize: 18,
                          weight: FontWeight.w600,
                          alignment: TextAlign.center,
                        ),
                        if ((controller.user.value.userId ?? "") != "")
                          Padding(
                            padding: EdgeInsets.only(top: 10.0 * fem),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: (controller.user.value.userId ?? "")
                                      .toString(),
                                  color: ColorPallete.theme,
                                  fontSize: 16,
                                  weight: FontWeight.bold,
                                  alignment: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 10 * fem,
                                ),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                            text: controller.user.value.userId
                                                .toString()))
                                        .then((value) {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          backgroundColor: ColorPallete.primary,
                                          duration: Duration(seconds: 3),
                                          message:
                                              "User Id Copied to clipboard !",
                                        ),
                                      );
                                    });
                                  },
                                  child: Icon(
                                    Icons.copy,
                                    color: ColorPallete.theme.withOpacity(0.75),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  // TextView(
                  //   text: "karomhatre@gmail.com",
                  //   color: ColorPallete.theme,
                  //   alignment: TextAlign.center,
                  //   fontSize: 14,
                  //   weight: FontWeight.w500,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.PACKAGES);
                      },
                      child: const RoundedContainer(
                        radius: 20,
                        gradient: LinearGradient(
                            colors: [Color(0xffc49e5f), Color(0xffa07c28)]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: TextView(
                              text: "Upgrade Now",
                              color: ColorPallete.theme,
                              weight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10 * fem,
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10 * fem, horizontal: 15 * fem),
                child: MyListView(
                  scroll: true,
                  children: [
                    DrawerItem(
                      // image: "assets/ui/home_icon.png",
                      icon: Icons.home,
                      title: "Home",
                      onPressed: () {
                        controller.setTabIndex.value = 0;
                      },
                    ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/search.png",
                      title: "Search",
                      onPressed: () {
                        Get.back();
                        Get.toNamed(
                          Routes.SEARCH,
                        );
                        // controller.setTabIndex.value = 1;
                      },
                    ),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     icon: Icons.visibility,
                    //     title: "Profile Visitors",
                    //     onPressed: () {
                    //       Get.toNamed(
                    //         Routes.PROFILE_VISITORS,
                    //       );
                    //     }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        icon: Icons.edit,
                        title: "Profile Edit",
                        onPressed: () {
                          Get.toNamed(Routes.SIGN_UP,
                              arguments: {"isLoggedIn": true});
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        icon: Icons.favorite,
                        title: "Interests",
                        onPressed: () {
                          Get.toNamed(
                            Routes.INTERESTS,
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        icon: Icons.block_rounded,
                        title: "Blocked Profiles",
                        onPressed: () {
                          Get.toNamed(
                            Routes.BLOCKED_PROFILES,
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        icon: Icons.person,
                        title: "My Package",
                        onPressed: () {
                          Get.find<SettingsController>().fetchMyPackage();
                          Get.toNamed(
                            Routes.MY_PACKAGE,
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        icon: Icons.people,
                        title: "Success Stories",
                        onPressed: () {
                          Get.toNamed(
                            Routes.SUCCESS_STORIES,
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // Divider(
                    //   thickness: 1 * fem,
                    //   height: 10 * fem,
                    //   color: ColorPallete.grey,
                    // ),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     icon: Icons.newspaper,
                    //     title: "News & Updates",
                    //     onPressed: () {
                    //       Get.toNamed(
                    //         Routes.NEWS_UPDATES,
                    //       );
                    //     }),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     // image: "assets/ui/events.png",
                    //     icon: Icons.chat,
                    //     title: "Chat",
                    //     onPressed: () {
                    //       Get.toNamed(
                    //         Routes.CHAT,
                    //       );
                    //     }),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    DrawerItem(
                        icon: Icons.info,
                        title: "About Us",
                        onPressed: () {
                          Get.toNamed(
                            Routes.ABOUT_US,
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                      image: "assets/ui/settings.png",
                      title: "Settings",
                      onPressed: () {
                        Get.toNamed(
                          Routes.SETTINGS,
                        );
                      },
                    ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "FAQs",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: InkWell(
            //     onTap: () async {
            //       await Get.find<AuthService>()
            //           .removeCurrentUser()
            //           .then((value) {
            //         Get.offAndToNamed(Routes.LOGIN);
            //       });
            //     },
            //     child: RoundedContainer(
            //       radius: 10 * fem,
            //       color: ColorPallete.primary,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
            //         child: const Center(
            //           child: TextView(
            //             text: "Log Out",
            //             color: ColorPallete.theme,
            //             fontSize: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 5 * fem,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final Function() onPressed;
  const DrawerItem(
      {super.key,
      this.icon,
      this.image,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return InkWell(
      onTap: () {
        Get.back();
        onPressed();
        // controller.setTabIndex.value = 1;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
        child: RoundedContainer(
          // height: 45,
          radius: 10,
          color: ColorPallete.primary.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0 * fem, vertical: 7.5 * fem),
            child: Center(
              child: Row(
                children: [
                  image != null
                      ? Image.asset(
                          image!,
                          color: ColorPallete.primary,
                          height: 25 * fem,
                        )
                      : icon != null
                          ? Icon(
                              icon,
                              color: ColorPallete.primary,
                            )
                          : const SizedBox.shrink(),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Center(
                    child: TextView(
                      text: title,
                      fontSize: 14,
                      weight: FontWeight.w500,
                      color: ColorPallete.secondary,
                    ),
                  ),
                  const Spacer(),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      "assets/ui/back.png",
                      width: 25 * fem,
                      color: ColorPallete.primary,
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
