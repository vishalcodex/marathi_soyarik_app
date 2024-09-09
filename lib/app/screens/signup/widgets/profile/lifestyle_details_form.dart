import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class LifestyleDetailsForm extends GetView<SignUpController> {
  const LifestyleDetailsForm({super.key});

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
                key: controller.lifestyleDetailsFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Lifestyle Details",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30 * fem,
                    ),
                    MyFormField(
                      fieldName: "Body Type",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.bodyTypes,
                      initialValue: controller.lifestyleDetails.value.bodyType,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.bodyType = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Skin Tone",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.skinTones,
                      initialValue: controller.lifestyleDetails.value.skinTone,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.skinTone = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Blood Group",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      dropDownOptions: const [
                        "A+",
                        "A-",
                        "B+",
                        "B-",
                        "AB+",
                        "AB-",
                        "O+",
                        "O-"
                      ],
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.lifestyleDetails.value.bloodGroup,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.bloodGroup = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Eating Habit (Veg/Non-Veg)",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.eatingHabits,
                      initialValue:
                          controller.lifestyleDetails.value.eatingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.eatingHabbit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Smokking Habit",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: const ["Yes", "No"],
                      initialValue:
                          controller.lifestyleDetails.value.smokingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.smokingHabbit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Drinking Habit",
                      // showFieldName: false,
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.text,
                      dropDownOptions: const ["Yes", "No"],
                      required: true,
                      initialValue:
                          controller.lifestyleDetails.value.drinkingHabbit,
                      onChanged: (value) {
                        controller.lifestyleDetails.value.drinkingHabbit =
                            value;
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
