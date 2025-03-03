import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

class StockIndicator extends StatelessWidget {
  const StockIndicator({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultMargin(width), bottom: kNormalPadding(height)),
      alignment: Alignment.topLeft,
      child: Text("In Stock",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.normal,
              color: kInStockColor,
              fontSize: 14)),
    );
  }
}
