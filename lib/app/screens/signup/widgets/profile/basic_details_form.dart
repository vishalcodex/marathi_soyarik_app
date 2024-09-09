import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/sign_up_controller.dart';
import '../form_fields.dart';

class PersonalDetailsForm extends GetView<SignUpController> {
  const PersonalDetailsForm({super.key});

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
                key: controller.basicDetailsFormKey,
                child: Obx(
                  () => Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextView(
                        text: "Basic Details",
                        color: ColorPallete.secondary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      //NAME
                      MyFormField(
                        fieldName: "Name",
                        initialValue: controller.basicDetails.value.name,
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        onChanged: (value) {
                          controller.basicDetails.value.name = value;
                        },
                      ),
                      //Height
                      MyFormField(
                        fieldName: "Height",
                        initialValue: controller.basicDetails.value.height,
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.heights,
                        // initialValue: controller.basicDetails.value,
                        onChanged: (value) {
                          controller.basicDetails.value.height = value;
                        },
                      ), //DOB
                      MyFormField(
                        fieldName: "Date Of Birth",
                        type: InputType.DATE,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.dOB,
                        onChanged: (value) {
                          controller.basicDetails.value.dOB = value;
                        },
                      ),
                      //Maritial Status
                      MyFormField(
                        fieldName: "Maritial Status",
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.maritialStatuses,
                        initialValue:
                            controller.basicDetails.value.maritalStatus,
                        onChanged: (value) {
                          controller.basicDetails.value.maritalStatus = value;
                        },
                      ),
                      //Hobbies
                      MyFormField(
                        fieldName: "Hobbies",
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.hobbies,
                        onChanged: (value) {
                          controller.basicDetails.value.hobbies = value;
                        },
                      ),
                      //Weight
                      MyFormField(
                        fieldName: "Weight",
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.weight,
                        onChanged: (value) {
                          controller.basicDetails.value.weight = value;
                        },
                      ),
                      //Birth Time
                      MyFormField(
                        fieldName: "Birth Time",
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.birthtime
                            ?.replaceAll(" ", ""),
                        onChanged: (value) {
                          controller.basicDetails.value.birthtime = value;
                        },
                      ),
                      //No of Childern
                      MyFormField(
                        fieldName: "No of Childern if any",
                        type: InputType.TEXT,
                        keyboard: TextInputType.number,
                        required: true,
                        initialValue:
                            controller.basicDetails.value.noofchildren,
                        onChanged: (value) {
                          controller.basicDetails.value.noofchildren = value;
                        },
                      ),
                      //Mothertounge
                      Obx(
                        () => MyFormField(
                          fieldName: "Mother Tounge",
                          type: InputType.DROP_DOWN,
                          keyboard: TextInputType.name,
                          required: true,
                          dropDownOptions: controller.mothertounges
                              .map((element) => element.name)
                              .toList(),
                          initialValue:
                              controller.basicDetails.value.mothertounge,
                          onChanged: (value) {
                            controller.basicDetails.value.mothertounge = value;
                          },
                        ),
                      ),
                      //Languages
                      MyFormField(
                        fieldName: "Languages",
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.languages,
                        onChanged: (value) {
                          controller.basicDetails.value.languages = value;
                        },
                      ),

                      //Birth Place
                      MyFormField(
                        fieldName: "Birth Place",
                        type: InputType.TEXT,
                        keyboard: TextInputType.name,
                        required: true,
                        initialValue: controller.basicDetails.value.birthplace,
                        onChanged: (value) {
                          controller.basicDetails.value.birthplace = value;
                        },
                      ),
                      //Birth Place
                      MyFormField(
                        fieldName: "Profile Created By",
                        type: InputType.DROP_DOWN,
                        keyboard: TextInputType.name,
                        required: true,
                        dropDownOptions: controller.profileCreators,
                        initialValue: controller.basicDetails.value.createdBy,
                        onChanged: (value) {
                          controller.basicDetails.value.createdBy = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
