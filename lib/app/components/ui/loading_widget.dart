import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../../common/color_pallete.dart';
import 'text_view.dart';

class Loading extends StatelessWidget {
  final Duration? duration;
  const Loading({super.key, this.duration});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      height: 200 * fem,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          height: 100 * fem,
          width: 100 * fem,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 0.9),
            duration: duration ?? const Duration(seconds: 3),
            curve: Curves.fastLinearToSlowEaseIn,
            builder: (context, value, child) {
              return LiquidCircularProgressIndicator(
                value: value, // Defaults to 0.5.
                valueColor: const AlwaysStoppedAnimation(ColorPallete
                    .primary), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.red,
                borderWidth: 2.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                center: TextView(
                  text: "Loading...",
                  weight: FontWeight.bold,
                  fontSize: 14,
                  color:
                      value > 0.45 ? ColorPallete.theme : ColorPallete.primary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

//   const Center(
//             child: SizedBox(
//               height: 200,
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: ColorPallete.primary,
//                 ),
//               ),
//             ),
//           )
