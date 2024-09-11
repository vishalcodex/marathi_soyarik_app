import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class ReligiousInformationForm extends GetView<SignUpController> {
  const ReligiousInformationForm({super.key});

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
                key: controller.religiousDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Religious Information",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    MyFormField(
                      fieldName: "Religion",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      dropDownOptions: controller.religions,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.religion,
                      onChanged: (value) {
                        controller.religiousDetails.value.religion = value;
                      },
                    ),
                    Obx(
                      () => MyFormField(
                        fieldName: "Caste",
                        // showFieldName: false,
                        type: InputType.DROP_DOWN,
                        dropDownOptions: controller.castes
                            .map((element) => element.name)
                            .toList(),
                        keyboard: TextInputType.text,
                        required: true,
                        initialValue: controller.religiousDetails.value.caste,
                        onChanged: (value) {
                          controller.religiousDetails.value.caste = value;
                        },
                      ),
                    ),
                    MyFormField(
                      fieldName: "Subcaste",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      // dropDownOptions: ["Maratha", "Marwadi", "Agri"],
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.subcaste,
                      onChanged: (value) {
                        controller.religiousDetails.value.subcaste = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextView(
                        text: "Are You Manglik ?",
                        color: ColorPallete.primary,
                        fontSize: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    MyFormField(
                      fieldName: "Manglik",
                      showFieldName: false,
                      type: InputType.DROP_DOWN,
                      dropDownOptions: const ["YES", "NO", "Do not know"],
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.manglik,
                      onChanged: (value) {
                        controller.religiousDetails.value.manglik = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Star",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.star,
                      onChanged: (value) {
                        controller.religiousDetails.value.star = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Horoscope",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.horoscope,
                      onChanged: (value) {
                        controller.religiousDetails.value.horoscope = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Gotra",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.gotra,
                      onChanged: (value) {
                        controller.religiousDetails.value.gotra = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Moonsign",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousDetails.value.moonsign,
                      onChanged: (value) {
                        controller.religiousDetails.value.moonsign = value;
                      },
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
