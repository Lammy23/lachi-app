import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

class BoldHeader extends StatelessWidget {
  const BoldHeader({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(left: width * 0.1, bottom: kNormalPadding(height)),
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: GoogleFonts.openSans(
            letterSpacing: 0,
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
