import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controller/auth_controller.dart';

import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/bg.jpeg",
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: ColorPallete.grey.withOpacity(0.5),
              //     spreadRadius: 5,
              //     blurRadius: 10,
              //   )
              // ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorPallete.theme.withOpacity(0.6),
                  ColorPallete.primary.withOpacity(0.7),
                  const Color(0xff3d0008)
                ],
                stops: [0, 0.3, 1],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: MyListView(
                        scroll: true,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/ui/logo.png",
                              height: 150,
                              width: 250,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Center(
                            child: Container(
                              child: RoundedContainer(
                                radius: 20,
                                clip: Clip.antiAliasWithSaveLayer,
                                // color: ColorPallete.theme,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MyListView(
                                    // mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: TextView(
                                          text: translations.appName.tr,
                                          fontSize: 22,
                                          weight: FontWeight.w700,
                                          color: ColorPallete.theme,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Center(
                                        child: TextView(
                                          text: translations.login.tr,
                                          fontSize: 18,
                                          weight: FontWeight.w500,
                                          color: ColorPallete.theme,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Obx(
                                        () => MyListView(
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              keyboardType: TextInputType.text,
                                              style: const TextStyle(
                                                  color: ColorPallete.theme),
                                              cursorColor: ColorPallete.theme,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    "Phone Number / User ID",
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: ColorPallete.theme),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorPallete.theme),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorPallete.theme),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter text';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds[
                                                    "mobile_number"] = value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              obscureText:
                                                  controller.showPassword.value,
                                              style: const TextStyle(
                                                  color: ColorPallete.theme),
                                              cursorColor: ColorPallete.theme,
                                              decoration:
                                                  InputDecoration().copyWith(
                                                labelText:
                                                    translations.password.tr,
                                                suffixIcon: IconButton(
                                                    icon: Icon(
                                                      !controller.showPassword
                                                              .value
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off,
                                                      color: ColorPallete.theme,
                                                    ),
                                                    onPressed: () {
                                                      controller.showPassword
                                                              .value =
                                                          !controller
                                                              .showPassword
                                                              .value;
                                                    }),
                                                labelStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: ColorPallete.theme),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorPallete.theme),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorPallete.theme),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter text';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password should be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                controller.creds["password"] =
                                                    value;
                                              },
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            controller.errorMessage.value == ""
                                                ? SizedBox.shrink()
                                                : TextView(
                                                    text: controller
                                                        .errorMessage.value,
                                                    fontSize: 14,
                                                    color: Colors.red,
                                                  ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        Routes.FORGOT_PASSWORD);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 5),
                                                    child: TextView(
                                                      text: "Forgot Password ?",
                                                      fontSize: 14,
                                                      color: ColorPallete.theme
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    if (!controller
                                                        .isLoading.value) {
                                                      controller.signIn();
                                                    }
                                                  },
                                                  // inkwell color
                                                  child: RoundedContainer(
                                                    radius: 50,
                                                    color: ColorPallete.primary,
                                                    child: SizedBox(
                                                      width: 150,
                                                      height: 56,
                                                      child: controller
                                                              .isLoading.value
                                                          ? const Center(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor: AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      ColorPallete
                                                                          .theme),
                                                                  strokeWidth:
                                                                      5.0,
                                                                ),
                                                              ),
                                                            )
                                                          : const Center(
                                                              child: TextView(
                                                                text: "LOGIN",
                                                                color:
                                                                    ColorPallete
                                                                        .theme,
                                                                fontSize: 16,
                                                                weight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                color: ColorPallete.theme, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: const Text(
                              'Create',
                              style: TextStyle(
                                  color: ColorPallete.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorPallete.primary;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.10);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
