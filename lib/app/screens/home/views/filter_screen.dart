import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../signup/widgets/form_fields.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class FilterScreen extends GetView<HomeController> {
  const FilterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorPallete.theme),
            backgroundColor: ColorPallete.primary,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.arrow_back,
                color: ColorPallete.theme,
              ),
            ),
            title: TextView(
              text: "Filter",
              color: ColorPallete.theme,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: MyListView(
                    scroll: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                        child: MyListView(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const TextView(
                              text: "Height",
                              fontSize: 16,
                              color: ColorPallete.primary,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: MyFormField(
                                    fieldName: "Height From",
                                    showFieldName: false,
                                    type: InputType.DROP_DOWN,
                                    keyboard: TextInputType.name,
                                    // required: true,
                                    dropDownOptions: List.generate(
                                        50, (index) => "${150 + index} cm"),
                                    // initialValue: controller.personalDetails["dob"],
                                    onChanged: (value) {},
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  child: TextView(
                                    text: "to",
                                    fontSize: 14,
                                    color: ColorPallete.primary,
                                  ),
                                ),
                                Expanded(
                                  child: MyFormField(
                                    fieldName: "Height to",
                                    showFieldName: false,
                                    type: InputType.DROP_DOWN,
                                    keyboard: TextInputType.name,
                                    // required: true,
                                    dropDownOptions: List.generate(
                                        50, (index) => "${150 + index} cm"),
                                    // initialValue: controller.personalDetails["dob"],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextView(
                              text: "Education",
                              fontSize: 16,
                              color: ColorPallete.primary,
                            ),
                            MyFormField(
                              fieldName: "Education",
                              showFieldName: false,
                              type: InputType.DROP_DOWN,
                              dropDownOptions: controller.educations,
                              keyboard: TextInputType.text,
                              required: true,
                              initialValue: "",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextView(
                              text: "Occupation",
                              fontSize: 16,
                              color: ColorPallete.primary,
                            ),
                            MyFormField(
                              fieldName: "Occupation",
                              showFieldName: false,
                              type: InputType.DROP_DOWN,
                              keyboard: TextInputType.text,
                              dropDownOptions: controller.occupations,
                              required: true,
                              initialValue: "",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextView(
                              text: "Caste",
                              fontSize: 16,
                              color: ColorPallete.primary,
                            ),
                            MyFormField(
                              fieldName: "Caste",
                              showFieldName: false,
                              type: InputType.TEXT,
                              keyboard: TextInputType.text,
                              required: true,
                              initialValue: "",
                              onChanged: (value) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RoundedContainer(
                    radius: 0,
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const RoundedContainer(
                              radius: 10,
                              color: ColorPallete.theme,
                              borderColor: ColorPallete.primary,
                              child: Center(
                                child: TextView(
                                  text: "Close",
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const RoundedContainer(
                              radius: 10,
                              color: ColorPallete.primary,
                              borderColor: ColorPallete.primary,
                              child: Center(
                                child: TextView(
                                  text: "Apply",
                                  color: ColorPallete.theme,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
