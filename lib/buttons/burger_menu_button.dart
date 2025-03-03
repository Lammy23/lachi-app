// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BurgerButton extends StatelessWidget {
  const BurgerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.centerLeft,
        onPressed: () {
          //code that opens the sidebar
          Scaffold.of(context).openDrawer();
        },
        icon: SvgPicture.asset(
          "assets/icons/burger_menu.svg",
          height: 16,
        ));
  }
}
