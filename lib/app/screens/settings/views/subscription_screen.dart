import 'package:marathi_soyarik/app/components/ui/rounded_container.dart';
import 'package:marathi_soyarik/app/components/ui/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/settings_controller.dart';

// ignore: must_be_immutable
class SubscriptionScreen extends GetView<SettingsController> {
  const SubscriptionScreen({Key? key}) : super(key: key);

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
          text: "My Subscriptions",
          color: ColorPallete.theme,
          fontSize: 18,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            RoundedContainer(
              radius: 0,
              color: ColorPallete.primary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
                child: RoundedContainer(
                  color: ColorPallete.theme,
                  radius: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: ColorPallete.grey,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: MyTextField(
                              hintText: "Search by TxnID",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: MyListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyListView(
                      children:
                          [1, 2].map((e) => _getSubscriptionView()).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSubscriptionView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 2.5,
            color: ColorPallete.grey.withOpacity(0.25),
            offset: Offset(0, 2.5),
          )
        ]),
        child: RoundedContainer(
          radius: 10,
          color: ColorPallete.theme,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyListView(
                        children: [
                          Row(
                            children: [
                              TextView(
                                text: "Txn Id # ",
                                fontSize: 14,
                                color: ColorPallete.secondary,
                              ),
                              TextView(
                                text: "pay_GcsdjGUSd234hj32r",
                                fontSize: 14,
                                color: ColorPallete.primary,
                                weight: FontWeight.w600,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: ColorPallete.secondary,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextView(
                                text: "21 Nov, 2020",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: TextView(
                                  text: "to",
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                ),
                              ),
                              TextView(
                                text: "21 Nov, 2021",
                                color: ColorPallete.secondary,
                                fontSize: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    RoundedContainer(
                      radius: 0,
                      child: TextView(
                        text: "299",
                        color: ColorPallete.primary,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Divider(
                  color: ColorPallete.grey.withOpacity(0.5),
                  thickness: 1,
                  // height: ,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.price_change_outlined,
                        color: ColorPallete.primary,
                        size: 30,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 2.5,
                            color: ColorPallete.grey.withOpacity(0.25),
                            offset: Offset(0, 2.5),
                          )
                        ]),
                        child: RoundedContainer(
                          radius: 10,
                          color: ColorPallete.theme,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: TextView(
                              text: "Paid",
                              color: ColorPallete.secondary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
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
