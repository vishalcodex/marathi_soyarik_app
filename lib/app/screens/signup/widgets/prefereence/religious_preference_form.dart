import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class ReligiousPeferenceForm extends GetView<SignUpController> {
  const ReligiousPeferenceForm({super.key});

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
                key: controller.religiousPreferenceFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: TextView(
                        text: "Religious Preference",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    MyFormField(
                      fieldName: "Religion",
                      type: InputType.MULTI_SELECT,
                      dropDownOptions: controller.religionsPref,
                      keyboard: TextInputType.none,
                      required: true,
                      initialValue:
                          controller.religiousPreference.value.religon,
                      onChanged: (value) {
                        controller.religiousPreference.value.religon = value;
                      },
                    ),
                    Obx(
                      () => MyFormField(
                        fieldName: "Caste",
                        type: InputType.MULTI_SELECT,
                        keyboard: TextInputType.none,
                        required: true,
                        dropDownOptions: controller.castes
                            .map((element) => element.name)
                            .toList(),
                        initialValue:
                            controller.religiousPreference.value.caste,
                        onChanged: (value) {
                          controller.religiousPreference.value.caste = value;
                        },
                      ),
                    ),
                    MyFormField(
                      fieldName: "Manglik",
                      type: InputType.DROP_DOWN,
                      keyboard: TextInputType.number,
                      required: true,
                      dropDownOptions: const [
                        "Any",
                        "Yes",
                        "No",
                        "Do not know"
                      ],
                      initialValue:
                          controller.religiousPreference.value.manglik,
                      onChanged: (value) {
                        controller.religiousPreference.value.manglik = value;
                      },
                    ),
                    MyFormField(
                      fieldName: "Star",
                      type: InputType.TEXT,
                      keyboard: TextInputType.text,
                      required: true,
                      initialValue: controller.religiousPreference.value.star,
                      onChanged: (value) {
                        controller.religiousPreference.value.star = value;
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
