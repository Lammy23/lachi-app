import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';
import 'package:lachi_app/screens/checkout/checkout_screen.dart';
import 'package:lachi_app/transitions/slide_transition.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context, SlidePageTransition(widget: const CheckoutScreen()));
      },
      alignment: Alignment.centerRight,
      icon: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/cart.svg",
              height: 23,
            ),
            Positioned(
              bottom: 23,
              left: 10,
              child: ValueListenableBuilder<int>(
                builder: (context, value, _) {
                  return cartList.isNotEmpty
                      ? Text(
                          '$value',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            color: kActionButtonColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        )
                      : Container();
                },
                valueListenable: cartTotal,
              ),
            ),
          ]),
    );
  }
}
