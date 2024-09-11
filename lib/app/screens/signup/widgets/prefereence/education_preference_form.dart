import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class EducationPeferenceForm extends GetView<SignUpController> {
  const EducationPeferenceForm({super.key});

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
                key: controller.educationPreferenceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Education & Occupation",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    MyFormField(
                      fieldName: "Education",
                      type: InputType.MULTI_SELECT,
                      keyboard: TextInputType.text,
                      dropDownOptions: controller.educationalOptions
                          .map((element) => element.category)
                          .toList(),
                      required: true,
                      initialValue:
                          controller.educationPreference.value.education,
                      onChanged: (value) {
                        controller.educationPreference.value.education = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Occupation",
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationPreference.value.occupation,
                      onChanged: (value) {
                        controller.educationPreference.value.occupation = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Annual Income",
                      type: InputType.MULTI_SELECT,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.annualIncome,
                      initialValue:
                          controller.educationPreference.value.annualIncome,
                      onChanged: (value) {
                        controller.educationPreference.value.annualIncome =
                            value;
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
