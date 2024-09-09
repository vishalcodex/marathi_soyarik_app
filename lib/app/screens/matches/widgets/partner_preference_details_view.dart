import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/partner_preference_model.dart';
import '../controllers/match_controller.dart';
import 'entry_widget.dart';

class PartnerPreferenceDetailView extends GetView<MatchController> {
  const PartnerPreferenceDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    BasicPreference basicPreference = BasicPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    ReligiousPreference religiousPreference = ReligiousPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    LocationPreference locationPreference = LocationPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
    EducationPreference educationPreference = EducationPreference.fromJson(
        controller.selectedProfile.value.partnerPreferance?.toJson() ?? {});
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
                  const TextView(
                    text: "Basic Preference :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: "Looking For",
                          value: basicPreference.lookingFor,
                        ),
                        EntryWidget(
                          title: "Skin Tone",
                          value: basicPreference.skinTone,
                        ),
                        EntryWidget(
                          title: "Age",
                          value:
                              "${basicPreference.fromAge} to ${basicPreference.toAge} Yrs",
                        ),
                        EntryWidget(
                          title: "Height",
                          value:
                              "${basicPreference.fromHeight} - ${basicPreference.toHeight}",
                        ),
                        EntryWidget(
                          title: "Mother Tounge",
                          value: basicPreference.mothertounge,
                        ),
                        EntryWidget(
                          title: "Eating Habbits",
                          value: basicPreference.eatingHabit,
                        ),
                        EntryWidget(
                          title: "Drinking Habbits",
                          value: basicPreference.drinkingHabit,
                        ),
                        EntryWidget(
                          title: "Smoking Habbits",
                          value: basicPreference.drinkingHabit,
                        ),
                        EntryWidget(
                          title: "Expectations",
                          value: basicPreference.generalExpt,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  const TextView(
                    text: "Religious Preference :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: "Religion",
                          value: religiousPreference.religon,
                        ),
                        EntryWidget(
                          title: "Caste",
                          value: religiousPreference.caste,
                        ),
                        EntryWidget(
                          title: "Manglik",
                          value: religiousPreference.manglik,
                        ),
                        EntryWidget(
                          title: "Star",
                          value: religiousPreference.star,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  const TextView(
                    text: "Location Preference :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: "Country",
                          value: locationPreference.country,
                        ),
                        EntryWidget(
                          title: "State",
                          value: locationPreference.state,
                        ),
                        EntryWidget(
                          title: "City",
                          value: locationPreference.city,
                        ),
                        EntryWidget(
                          title: "Residence",
                          value: locationPreference.residence,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  ),
                  const TextView(
                    text: "Education & Occupation Preference :-",
                    fontSize: 14,
                    weight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5 * fem),
                    child: MyListView(
                      children: [
                        EntryWidget(
                          title: "Education",
                          value: educationPreference.education,
                        ),
                        EntryWidget(
                          title: "Occupation",
                          value: educationPreference.occupation,
                        ),
                        EntryWidget(
                          title: "Annual Income",
                          value: educationPreference.annualIncome,
                        ),
                      ],
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
