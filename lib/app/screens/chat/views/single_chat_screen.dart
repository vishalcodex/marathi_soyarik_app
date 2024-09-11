import 'package:marathi_soyarik/app/components/ui/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/chat_controller.dart';

// ignore: must_be_immutable
class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

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
          text: "Chats",
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: MyListView(
                      children:
                          [1, 2, 3, 4].map((e) => _getChatView()).toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getChatView() {
    return RoundedContainer(radius: 0);
  }
}
