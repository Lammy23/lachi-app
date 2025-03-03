import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LachiButton extends StatelessWidget {
  const LachiButton({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/lachi_logo.svg",
      height: 47,
    );
  }
}
