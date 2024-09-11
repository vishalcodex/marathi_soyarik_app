import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class EducationDetailsForm extends GetView<SignUpController> {
  const EducationDetailsForm({super.key});

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
                key: controller.educationDetailsFormKey,
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
                      height: 30 * fem,
                    ),
                    MyFormField(
                      fieldName: "Education",
                      // showFieldName: false,
                      type: InputType.MULTI_SELECT,
                      dropDownOptions: controller.educationalOptions
                          .map((element) => element.category)
                          .toList(),
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.educationDetails.value.education,
                      onChanged: (value) {
                        controller.educationDetails.value.education = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Occupation",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.occupation,
                      onChanged: (value) {
                        controller.educationDetails.value.occupation = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Employee In",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.employeeIn,
                      onChanged: (value) {
                        controller.educationDetails.value.employeeIn = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Designation",
                      // showFieldName: false,
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.educationDetails.value.designation,
                      onChanged: (value) {
                        controller.educationDetails.value.designation = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Annual Income",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.annualIncome,
                      initialValue:
                          controller.educationDetails.value.annualIncome,
                      onChanged: (value) {
                        controller.educationDetails.value.annualIncome = value;
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
