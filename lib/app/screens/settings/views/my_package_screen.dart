import 'package:marathi_soyarik/app/models/my_package_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/settings_controller.dart';

// ignore: must_be_immutable
class MyPackageScreen extends GetView<SettingsController> {
  const MyPackageScreen({Key? key}) : super(key: key);

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
          text: "My Package",
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
              child: RefreshIndicator(
                onRefresh: () {
                  controller.fetchMyPackage();
                  return Future.value();
                },
                child: MyListView(
                  scroll: true,
                  children: [
                    Obx(
                      () => controller.myPackage.value.packageDetails == null
                          ? const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                    color: ColorPallete.primary),
                              ),
                            )
                          : MyPackageWidget(
                              myPackage: controller.myPackage.value,
                            ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0 * fem),
              child: RoundedContainer(
                onPressed: () {
                  Get.toNamed(Routes.PACKAGES);
                },
                radius: 10,
                height: 50,
                color: ColorPallete.primary,
                child: Padding(
                  padding: EdgeInsets.all(15 * fem),
                  child: const Center(
                    child: TextView(
                      text: "See All Packages",
                      color: ColorPallete.theme,
                      weight: FontWeight.bold,
                      fontSize: 14,
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

class MyPackageWidget extends StatelessWidget {
  final MyPackageDetails myPackage;
  const MyPackageWidget({super.key, required this.myPackage});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 15 * fem),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 * fem),
            boxShadow: [
              BoxShadow(
                color: ColorPallete.grey.withOpacity(0.25),
                blurRadius: 15 * fem,
                spreadRadius: 5 * fem,
                offset: Offset(0, 2.5 * fem),
              )
            ]),
        child: RoundedContainer(
          radius: 10,
          color: ColorPallete.theme,
          child: Padding(
            padding: EdgeInsets.all(10.0 * fem),
            child: MyListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPallete.grey.withOpacity(0.25),
                          blurRadius: 15 * fem,
                          spreadRadius: 5 * fem,
                          offset: Offset(0, 2.5 * fem),
                        )
                      ]),
                  child: RoundedContainer(
                    radius: 10,
                    color: ColorPallete.theme,
                    child: Padding(
                      padding: EdgeInsets.all(10.0 * fem),
                      child: Row(
                        children: [
                          TextView(
                            text: myPackage.packageDetails!.packName!,
                            fontSize: 14,
                            weight: FontWeight.bold,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.green,
                            size: 20 * fem,
                          ),
                          SizedBox(
                            width: 10 * fem,
                          ),
                          TextView(
                            text:
                                "${(myPackage.userCount!.isActive ?? false) ? "ACTIVE" : "IN ACTIVE"} Plan",
                            color: (myPackage.userCount!.isActive ?? false)
                                ? Colors.green
                                : ColorPallete.red,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                EntryWidget(
                    title: "Total Amount Paid",
                    value: "₹ ${myPackage.packageDetails!.packAmmount}/-"),
                EntryWidget(
                    title: "Total Interests",
                    value:
                        "${myPackage.userCount!.totalInterest} / ${myPackage.packageDetails!.totalInterest}"),
                EntryWidget(
                    title: "Total WhatsApp Chats",
                    value:
                        "${myPackage.userCount!.totalChat} / ${myPackage.packageDetails!.totalChat}"),
                EntryWidget(
                    title: "Total Contacts",
                    value:
                        "${myPackage.userCount!.totalContact} / ${myPackage.packageDetails!.totalContact}"),
                EntryWidget(
                    title: "Duration Remaining",
                    value:
                        "${myPackage.userCount!.daysRemaining} /${myPackage.packageDetails!.duration} days"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "${title} : ",
            fontSize: 14,
            color: ColorPallete.secondary,
          ),
          const Spacer(),
          TextView(
            text: (value ?? "") == "" ? "N/A" : value!,
            fontSize: 14,
            // maxlines: 2,
            // overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
