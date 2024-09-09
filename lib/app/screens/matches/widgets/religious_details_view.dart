import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../models/user_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

class ReligiousDetailsView extends GetView<MatchController> {
  const ReligiousDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    ReligiousDetails profile =
        ReligiousDetails.fromJson(controller.selectedProfile.value.toJson());
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
                  EntryWidget(title: "Religion", value: profile.religion),
                  EntryWidget(title: "Caste", value: profile.caste),
                  EntryWidget(title: "Sub Caste", value: profile.subcaste),
                  EntryWidget(title: "Gotra", value: profile.gotra),
                  EntryWidget(title: "Manglik", value: profile.manglik),
                  EntryWidget(title: "Horoscope", value: profile.horoscope),
                  EntryWidget(title: "Star", value: profile.star),
                  EntryWidget(title: "Moonsign", value: profile.moonsign),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
