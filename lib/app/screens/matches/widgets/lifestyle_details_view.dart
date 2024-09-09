import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../models/user_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

class LifestyleDetailsView extends GetView<MatchController> {
  const LifestyleDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    LifestyleDetails profile =
        LifestyleDetails.fromJson(controller.selectedProfile.value.toJson());
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
                  EntryWidget(title: "Body Type", value: profile.bodyType),
                  EntryWidget(title: "Skin Tone", value: profile.skinTone),
                  EntryWidget(title: "Blood Group", value: profile.bloodGroup),
                  EntryWidget(
                      title: "Eating Habit", value: profile.eatingHabbit),
                  EntryWidget(
                      title: "Drinking Habit", value: profile.drinkingHabbit),
                  EntryWidget(
                      title: "Smoking Habit", value: profile.smokingHabbit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
