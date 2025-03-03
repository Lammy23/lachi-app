import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/buttons/change_quantity.dart';
import 'package:lachi_app/buttons/delete_button.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';

class CheckoutBlock extends StatelessWidget {
  const CheckoutBlock({
    Key? key,
    required this.productColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final String productColor;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: kGroupedPadding(
              height,
            )),
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(0.25),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                right: kDefaultMargin(width),
                left: kDefaultMargin(width),
                bottom: kGroupedPadding(
                  height,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/${productColor}_beans_peeler_bgremoved.png",
                  width: kCheckoutImageSize(width),
                ),
                SizedBox(width: kCheckoutBlockSpaceBox(width)),
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LACHI Beans Peeler 3-in-1",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            )),
                        productColor == "black"
                            ? ValueListenableBuilder<String>(
                                valueListenable: blackPriceTag,
                                builder: (context, value, _) {
                                  return Text("N$value",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ));
                                },
                              )
                            : ValueListenableBuilder<String>(
                                valueListenable: orangePriceTag,
                                builder: (context, value, _) {
                                  return Text("N$value",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ));
                                }),
                        Text("In Stock",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.normal,
                                color: kInStockColor,
                                fontSize: 14)),
                        Container(
                          margin: EdgeInsets.only(bottom: height * 0.0123),
                          child: Text(productColor.toUpperCase(),
                              style: GoogleFonts.openSans(
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChangeQuantity(
                                isBlack: productColor == "black" ? true : false,
                                amount:
                                    blockIsBlack ? countBlack() : countOrange(),
                                height: height,
                                width: width),
                            DeleteButton(productColor: productColor)
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
