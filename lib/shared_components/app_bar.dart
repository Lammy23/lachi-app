import 'package:flutter/material.dart';
import 'package:lachi_app/buttons/cart_button.dart';
import 'package:lachi_app/buttons/go_back_button.dart';
import 'package:lachi_app/buttons/lachi_logo_button.dart';
import 'package:lachi_app/logic/constants.dart';
import 'package:lachi_app/buttons/burger_menu_button.dart';

class LachiAppBar extends StatelessWidget {
  const LachiAppBar({
    Key? key,
    required this.height,
    required this.width,
    required this.screen, //to know which screen it's own so that it can change accordingly
  }) : super(key: key);

  final double height;
  final double width;

  final String screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: kAppBarColor,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, kEdgePadding(height)),
              padding: EdgeInsets.fromLTRB(
                kDefaultMargin(width),
                0,
                kDefaultMargin(width),
                0,
              ),
              width: double.infinity,
              height: 70,
              color: kAppBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  screen == "home_screen"
                      ? const BurgerButton()
                      : const GoBackButton(),
                  screen == "final_form"
                      ? Container(
                          height: 1,
                        )
                      : const LachiButton(),
                  screen == "final_form"
                      ? const LachiButton()
                      : const CartButton()
                ],
              )),
        ],
      ),
    );
  }
}
