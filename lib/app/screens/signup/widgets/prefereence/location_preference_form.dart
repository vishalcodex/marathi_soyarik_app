import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class LocationPeferenceForm extends GetView<SignUpController> {
  const LocationPeferenceForm({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.locationPreferenceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Location Preference",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    Obx(
                      () => Column(
                        children: [
                          MyFormField(
                            fieldName: "Country",
                            // showFieldName: false,
                            type: InputType.DROP_DOWN,
                            keyboard: TextInputType.text,
                            required: true,
                            dropDownOptions: controller.countries
                                .map((element) => element.name)
                                .toList(),
                            initialValue:
                                (controller.locationPreference.value.country ??
                                            "") !=
                                        ""
                                    ? controller.countries
                                            .where((p0) =>
                                                p0.id ==
                                                int.parse(controller
                                                        .locationPreference
                                                        .value
                                                        .country ??
                                                    "0"))
                                            .isNotEmpty
                                        ? controller.countries
                                            .where((p0) =>
                                                p0.id ==
                                                int.parse(controller
                                                        .locationPreference
                                                        .value
                                                        .country ??
                                                    "0"))
                                            .first
                                            .name
                                        : null
                                    : "",
                            onChanged: (value) {
                              controller.onCountryPrefChanged(value, false);
                            },
                          ),
                          if (controller.states.isNotEmpty)
                            MyFormField(
                              fieldName: "State",
                              // showFieldName: false,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.states
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue:
                                  (controller.locationPreference.value.state ??
                                              "") !=
                                          ""
                                      ? controller.states
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationPreference
                                                          .value
                                                          .state ??
                                                      "0"))
                                              .isNotEmpty
                                          ? controller.states
                                              .where((p0) =>
                                                  p0.id ==
                                                  int.parse(controller
                                                          .locationPreference
                                                          .value
                                                          .state ??
                                                      "0"))
                                              .first
                                              .name
                                          : null
                                      : "",
                              onChanged: (value) {
                                controller.onStatePrefChanged(value, false);
                              },
                            ),
                          if (controller.cities.isNotEmpty)
                            MyFormField(
                              fieldName: "City",
                              // showFieldName: false,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              required: true,
                              dropDownOptions: controller.cities
                                  .map((element) => element.name)
                                  .toList(),
                              initialValue: (controller
                                              .locationPreference.value.city ??
                                          "") !=
                                      ""
                                  ? controller.cities
                                          .where((p0) =>
                                              p0.id ==
                                              int.parse(controller
                                                      .locationPreference
                                                      .value
                                                      .city ??
                                                  "0"))
                                          .isNotEmpty
                                      ? controller.cities
                                          .where((p0) =>
                                              p0.id ==
                                              int.parse(controller
                                                      .locationPreference
                                                      .value
                                                      .city ??
                                                  "0"))
                                          .first
                                          .name
                                      : null
                                  : "",
                              onChanged: (value) {
                                controller.onCityPrefChanged(value, false);
                              },
                            ),
                        ],
                      ),
                    ),
                    MyFormField(
                      fieldName: "Residence (Citizen/NRI)",
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.number,
                      required: true,
                      dropDownOptions: ["Citizen", "NRI"],
                      initialValue:
                          controller.locationPreference.value.residence,
                      onChanged: (value) {
                        controller.locationPreference.value.residence = value;
                      },
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
