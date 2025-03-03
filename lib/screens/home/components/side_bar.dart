import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: kDefaultMargin(
            width,
          ),
          top: kDefaultMargin(width)),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Help",
            style: GoogleFonts.openSans(
              color: kSecondaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: kEdgePadding(height),
            width: kEdgePadding(height),
          ),
          Text(
            "Return Policy",
            style: GoogleFonts.openSans(
              color: kSecondaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
