import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
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
          left: kDefaultMargin(width),
          right: kDefaultMargin(width),
          bottom: kNormalPadding(height)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About this item\n",
              style: GoogleFonts.openSans(
                  fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left),
          Text(
            "LACHI Beans Peeler 3-in-1 Black comes with a 3.5 ltr processing bowl, 1.8 ltr blender jar, and a cup for dry grinding.\n\nIt is powered by a 220 - 240 V, 1000 W motor base with non-slip feet and has a 1 year warranty.",
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
