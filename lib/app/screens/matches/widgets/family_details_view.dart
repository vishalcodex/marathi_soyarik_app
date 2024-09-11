import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../models/user_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

class FamilyDetailsView extends GetView<MatchController> {
  const FamilyDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    FamilyDetails profile =
        FamilyDetails.fromJson(controller.selectedProfile.value.toJson());
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
                  EntryWidget(title: "Family Type", value: profile.familyType),
                  EntryWidget(
                      title: "Father's Name", value: profile.fathersName),
                  EntryWidget(
                      title: "Father's Occupation",
                      value: profile.fathersOccupation),
                  EntryWidget(
                      title: "Mother's Name", value: profile.mothersName),
                  EntryWidget(
                      title: "Mother's Occupation",
                      value: profile.mothersOccupation),
                  EntryWidget(
                      title: "No. of Brothers", value: profile.noOfBrothers),
                  EntryWidget(
                      title: "No. of Married Brothers",
                      value: profile.noOfMarriedBrothers),
                  EntryWidget(
                      title: "No. of Sisters", value: profile.noOfSisters),
                  EntryWidget(
                      title: "No. of Married Sisters",
                      value: profile.noOfMarriedSisters),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
