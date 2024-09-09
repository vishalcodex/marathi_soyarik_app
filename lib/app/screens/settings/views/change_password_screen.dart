import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../signup/widgets/form_fields.dart';
import '../controllers/settings_controller.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends GetView<SettingsController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Change Password",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: MyListView(
                children: [
                  MyListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MyListView(
                          children: [
                            MyFormField(
                              fieldName: "Old Password",
                              type: InputType.TEXT,
                              required: true,
                              keyboard: TextInputType.text,
                              onChanged: (value) {},
                            ),
                            MyFormField(
                              fieldName: "New Password",
                              type: InputType.TEXT,
                              required: true,
                              keyboard: TextInputType.text,
                              onChanged: (value) {},
                            ),
                            MyFormField(
                              fieldName: "Confirm New Password",
                              type: InputType.TEXT,
                              required: true,
                              keyboard: TextInputType.text,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RoundedContainer(
                radius: 20,
                color: ColorPallete.primary,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextView(
                      text: "Update",
                      fontSize: 14,
                      color: ColorPallete.theme,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
