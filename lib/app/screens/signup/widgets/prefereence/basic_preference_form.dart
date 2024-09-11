import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class BasicPreferenceForm extends GetView<SignUpController> {
  const BasicPreferenceForm({super.key});

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
                key: controller.basicPreferenceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Basic Preference",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    MyFormField(
                      fieldName: "Looking For",
                      type: InputType.MULTI_SELECT,
                      keyboard: TextInputType.text,
                      dropDownOptions: const [
                        "Divorced",
                        "Never Married",
                        "Widow",
                        "Widower",
                      ],
                      required: true,
                      initialValue: controller.basicPreference.value.lookingFor,
                      onChanged: (value) {
                        controller.basicPreference.value.lookingFor = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Skin Tone",
                      type: InputType.MULTI_SELECT,
                      keyboard: TextInputType.text,
                      required: true,
                      dropDownOptions: controller.skinTonesPref,
                      initialValue: controller.basicPreference.value.skinTone,
                      onChanged: (value) {
                        controller.basicPreference.value.skinTone = value;
                      },
                    ),
                    Obx(
                      () => MyFormField(
                        fieldName: "Mother Tounge",
                        type: InputType.MULTI_SELECT,
                        keyboard: TextInputType.text,
                        dropDownOptions: controller.mothertounges
                            .map((element) => element.name)
                            .toList(),
                        required: true,
                        initialValue:
                            controller.basicPreference.value.mothertounge,
                        onChanged: (value) {
                          controller.basicPreference.value.mothertounge = value;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyFormField(
                            fieldName: "From Age",
                            type: InputType.DROP_DOWN,
                            dropDownOptions:
                                List.generate(48, (index) => "${index + 18}"),
                            keyboard: TextInputType.number,
                            required: true,
                            initialValue:
                                controller.basicPreference.value.fromAge,
                            onChanged: (value) {
                              controller.basicPreference.value.fromAge = value;
                            },
                          ),
                        ),
                        Expanded(
                          child: MyFormField(
                            fieldName: "To Age",
                            type: InputType.DROP_DOWN,
                            dropDownOptions:
                                List.generate(48, (index) => "${index + 18}"),
                            keyboard: TextInputType.number,
                            required: true,
                            initialValue:
                                controller.basicPreference.value.toAge,
                            onChanged: (value) {
                              controller.basicPreference.value.toAge = value;
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyFormField(
                            fieldName: "From Height",
                            type: InputType.DROP_DOWN,
                            dropDownOptions: controller.heights,
                            keyboard: TextInputType.number,
                            required: true,
                            initialValue:
                                controller.basicPreference.value.fromHeight,
                            onChanged: (value) {
                              controller.basicPreference.value.fromHeight =
                                  value;
                            },
                          ),
                        ),
                        Expanded(
                          child: MyFormField(
                            fieldName: "To Height",
                            type: InputType.DROP_DOWN,
                            dropDownOptions: controller.heights,
                            keyboard: TextInputType.number,
                            required: true,
                            initialValue:
                                controller.basicPreference.value.toHeight,
                            onChanged: (value) {
                              controller.basicPreference.value.toHeight = value;
                            },
                          ),
                        )
                      ],
                    ),
                    MyFormField(
                      fieldName: "Eating Habit",
                      type: InputType.DROP_DOWN,
                      dropDownOptions: controller.eatingHabits,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.basicPreference.value.eatingHabit,
                      onChanged: (value) {
                        controller.basicPreference.value.eatingHabit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Drrinking Habit",
                      type: InputType.DROP_DOWN,
                      dropDownOptions: controller.drinkingHabits,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.basicPreference.value.drinkingHabit,
                      onChanged: (value) {
                        controller.basicPreference.value.drinkingHabit = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "General Expectations",
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue:
                          controller.basicPreference.value.generalExpt,
                      onChanged: (value) {
                        controller.basicPreference.value.generalExpt = value;
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
