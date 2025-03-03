import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/buttons/action_button.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/shared_components/app_bar.dart';
import 'package:lachi_app/shared_components/bold_header.dart';
import 'package:lachi_app/shared_components/light_header.dart';

import '../../logic/constants.dart';
import 'components/checkout_block.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String screen = "final_form";
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LachiAppBar(height: height, width: width, screen: screen),
        BoldHeader(width: width, height: height, text: "Cart"),
        ValueListenableBuilder<bool>(
          builder: (context, value, _) {
            return value
                ? CheckoutBlock(
                    productColor: "black", width: width, height: height)
                : Container();
          },
          valueListenable: cartHasBlack,
        ),
        ValueListenableBuilder<bool>(
          builder: (context, value, _) {
            return value
                ? CheckoutBlock(
                    productColor: "orange", width: width, height: height)
                : Container();
          },
          valueListenable: cartHasOrange,
        ),
        Container(
          margin: EdgeInsets.only(
              bottom: kGroupedPadding(
            height,
          )),
          width: double.infinity,
          height: 1,
          color: Colors.black.withOpacity(0.25),
        ),
        ValueListenableBuilder(
          valueListenable: cartTotal,
          builder: (context, value, _) {
            return value == 0
                ? LightHeader(
                    width: width,
                    height: height,
                    text: "Hmm looks like its empty")
                : Container();
          },
        ),
        Container(
          margin: EdgeInsets.fromLTRB(kDefaultMargin(width), 0,
              kDefaultMargin(width), kEdgePadding(height)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: cartTotal,
                builder: (context, value, _) {
                  return value != 0
                      ? Text(
                          "Grand Total",
                          style: GoogleFonts.openSans(
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        )
                      : Container();
                },
              ),
              ValueListenableBuilder(
                valueListenable: formattedTotalPrice,
                builder: (context, value, _) {
                  return value != '0'
                      ? Text(
                          "N$value",
                          style: GoogleFonts.openSans(
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      : Container();
                },
              )
            ],
          ),
        ),
        ValueListenableBuilder<int>(
          builder: (context, value, _) {
            return value != 0
                ? ActionButton(
                    height: height,
                    width: width,
                    actionText: "Proceed to checkout ($value items)")
                : Container();
          },
          valueListenable: cartTotal,
        ),
        ValueListenableBuilder<int>(
          valueListenable: cartTotal,
          builder: (context, value, _) {
            return value != 0
                ? Text("Shipping Calculated at Checkout",
                    style: GoogleFonts.openSans(
                      color: kPrimaryTextColor.withOpacity(0.5),
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ))
                : Container();
          },
        ),
      ],
    ));
  }
}
