import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/text_view.dart';

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: "${title} : ",
            fontSize: 14,
            color: ColorPallete.secondary,
          ),
          Expanded(
            child: TextView(
              text: (value ?? "") == "" ? "N/A" : value!,
              fontSize: 14,
              // maxlines: 2,
              // overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
