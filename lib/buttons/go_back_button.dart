import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.of(context).pop();
      }, //neat code that actually goes back,
      icon: SvgPicture.asset(
        "assets/icons/back_button.svg",
        height: 20,
      ),
    );
  }
}
