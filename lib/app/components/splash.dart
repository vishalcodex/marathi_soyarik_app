import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/color_pallete.dart';
import '../routes/app_routes.dart';
import 'ui/my_list_view.dart';
import 'ui/text_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[Ui.parseColor("#FFA36F"), Ui.parseColor("#FF659C")],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  bool showLangOptions = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: Container(
        color: ColorPallete.theme,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 10 * fem,
                  // ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0 * fem),
                      child: AnimatedContainer(
                        height: 250 * fem,
                        duration: const Duration(seconds: 2),
                        child: Image.asset(
                          "assets/ui/logo.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextView(
                      text: "Discover True Love,\nWhere Soulmates Meet",
                      color: ColorPallete.primary,
                      fontSize: 18,
                      alignment: TextAlign.center,
                      weight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextView(
                text: "Powered by Codex Technologies",
                color: ColorPallete.grey,
                fontSize: 12,
                alignment: TextAlign.center,
                weight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  void showLanguagePopUp(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyListView(
              children: [
                const Center(
                  child: TextView(
                    text: "Choose Language",
                    color: ColorPallete.primary,
                    fontSize: 16,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                SizedBox(
                  height: 100 * fem,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("en", "EN"));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/ui/english.png",
                                height: 80 * fem,
                                width: 80 * fem,
                                color: Color(0xff6e61b7),
                              ),
                              const Spacer(),
                              const Center(
                                child: TextView(
                                  text: "English",
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            Get.updateLocale(const Locale("mr", "MAR"));
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.asset(
                                    "assets/ui/marathi.png",
                                    height: 65 * fem,
                                    width: 65 * fem,
                                    // color: Color(0xff6e61b7),
                                  ),
                                ),
                              ),
                              const Center(
                                child: TextView(
                                  text: "Marathi",
                                  color: ColorPallete.primary,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
