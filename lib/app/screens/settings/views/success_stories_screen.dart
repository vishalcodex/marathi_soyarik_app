import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/loading_widget.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/success_story_model.dart';
import '../../../providers/api_endpoints.dart';
import '../controllers/settings_controller.dart';

import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class SuccessStoriesScreen extends GetView<SettingsController> {
  const SuccessStoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    controller.getSuccessStories();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorPallete.theme),
        backgroundColor: ColorPallete.primary,
        title: const TextView(
          text: "Success Stories",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: controller.isLoading.value
                    ? const Loading()
                    : RefreshIndicator(
                        onRefresh: () {
                          controller.getSuccessStories();
                          return Future.value(true);
                        },
                        child: MyListView(
                          scroll: true,
                          children: [
                            controller.successStories.isEmpty &&
                                    !controller.isLoading.value
                                ? SizedBox(
                                    height: 200 * fem,
                                    child: const Center(
                                      child: TextView(
                                        text: "No More Macthes !",
                                        color: ColorPallete.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                : MyListView(
                                    children: controller.successStories
                                        .map(
                                          (e) => SuccessStoryWidget(story: e),
                                        )
                                        .toList(),
                                  ),
                            if (controller.isLoading.value) const Loading()
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessStoryWidget extends StatelessWidget {
  final SuccessStory story;
  const SuccessStoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0 * fem, vertical: 15 * fem),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 * fem),
            boxShadow: [
              BoxShadow(
                color: ColorPallete.grey.withOpacity(0.25),
                blurRadius: 15 * fem,
                spreadRadius: 5 * fem,
                offset: Offset(0, 2.5 * fem),
              )
            ]),
        child: InkWell(
          onTap: () async {},
          child: RoundedContainer(
            radius: 10,
            clip: Clip.antiAliasWithSaveLayer,
            color: ColorPallete.theme,
            child: MyListView(
              children: [
                RoundedContainer(
                  radius: 10,
                  // clip: Clip.antiAliasWithSaveLayer,
                  color: ColorPallete.primary.withOpacity(0.25),
                  // height: MediaQuery.of(context).size.height / 3 * fem,
                  child: MyListView(
                    children: [
                      CachedNetworkImage(
                        imageUrl: (story.image ?? "") == ""
                            ? ""
                            : "${Urls.baseUrl}admin/${story.image!}",
                        placeholder: (context, url) {
                          return Image.asset(
                            "assets/ui/logo.png",
                            height: 200 * fem,
                          );
                        },
                        height: MediaQuery.of(context).size.height * 0.4 * fem,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) {
                          return RoundedContainer(
                            radius: 0,
                            child: Center(
                              child: Image.asset(
                                "assets/ui/logo.png",
                                height: 200 * fem,
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: MyListView(
                          children: [
                            TextView(
                              text: story.title.toString().capitalize!,
                              fontSize: 16,
                              color: ColorPallete.primary,
                              weight: FontWeight.bold,
                              alignment: TextAlign.center,
                            ),
                            Html(
                              data: story.desc1!,
                              style: {
                                "body": Style(
                                  color: ColorPallete.secondary,
                                  fontSize: FontSize(14),
                                  textAlign: TextAlign.justify,
                                )
                              },
                            ),
                          ],
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
    );
  }
}
