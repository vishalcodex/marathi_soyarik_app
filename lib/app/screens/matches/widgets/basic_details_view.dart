import 'package:marathi_soyarik/app/models/mathc_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/user_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

class BasicDetailsView extends GetView<MatchController> {
  const BasicDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    BasicDetails profile =
        BasicDetails.fromJson(controller.selectedProfile.value.toJson());

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 7.5 * fem),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 * fem),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15 * fem,
                  spreadRadius: 2 * fem,
                  color: ColorPallete.grey.withOpacity(0.2),
                  offset: Offset(0, 5 * fem))
            ]),
        child: Padding(
          padding: EdgeInsets.all(5.0 * fem),
          child: RoundedContainer(
            radius: 10,
            color: ColorPallete.theme,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15 * fem, vertical: 10 * fem),
              child: MyListView(
                scroll: true,
                children: [
                  SizedBox(
                    height: 45 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: EntryWidget(title: "ID", value: profile.id)),
                        Expanded(
                            child: Center(
                          child: Obx(
                            () => !controller.isMyProfile.value &&
                                    !controller.showContact.value
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        if (!controller
                                            .isShowingContact.value) {
                                          controller.isShowingContact.value =
                                              true;
                                          controller
                                              .contactProfile(
                                                  MatchProfile(
                                                      profileId: profile.id),
                                                  context)
                                              .then((value) {
                                            if (value) {
                                              controller.showContact.value =
                                                  true;
                                              controller.isShowingContact
                                                  .value = false;
                                            }
                                          });
                                        }
                                      },
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 35,
                                        color: ColorPallete.primary,
                                        child: controller.isShowingContact.value
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.0 * fem),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: ColorPallete.theme,
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10 * fem,
                                                    vertical: 5.0 * fem),
                                                child: const Center(
                                                  child: TextView(
                                                    text: "View Contact",
                                                    color: ColorPallete.theme,
                                                    fontSize: 14,
                                                    weight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // const TextView(
                                        //   text: "Contact: ",
                                        //   fontSize: 14,
                                        //   color: ColorPallete.secondary,
                                        // ),

                                        Icon(
                                          Icons.phone,
                                          color: ColorPallete.primary,
                                          size: 20 * fem,
                                        ),
                                        Expanded(
                                          child: TextView(
                                            text: (profile.mobile ?? "") == ""
                                                ? "N/A"
                                                : " : +91 ${profile.mobile}",
                                            fontSize: 14,
                                            weight: FontWeight.bold,
                                            // maxlines: 2,
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  EntryWidget(title: "Name", value: profile.name),
                  EntryWidget(
                      title: "Mother Tounge", value: profile.mothertounge),
                  EntryWidget(
                      title: "Marital Status", value: profile.maritalStatus),
                  EntryWidget(title: "Birth Date", value: profile.dOB),
                  EntryWidget(title: "Birth Place", value: profile.birthplace),
                  EntryWidget(title: "Birth Time", value: profile.birthtime),
                  EntryWidget(title: "Gender", value: profile.gender),
                  EntryWidget(title: "Height", value: profile.height),
                  EntryWidget(title: "Languages", value: profile.languages),
                  EntryWidget(title: "Hobbies", value: profile.hobbies),
                  EntryWidget(title: "Weight", value: profile.weight),
                  EntryWidget(
                      title: "No. Of Children", value: profile.noofchildren),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
