import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    Key? key,
    required this.isBlack,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  final bool isBlack;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  initState() {
    setState(() {
      number = null;
    });
    super.initState();
  }

  DropdownMenuItem<String> buildMenuItem(String number) => DropdownMenuItem(
      value: number,
      child: Text(
        number,
        style: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultMargin(widget.width),
        right: kDefaultMargin(widget.width),
      ),
      width: 82,
      child: DropdownButtonFormField<String>(
        alignment: Alignment.center,
        icon: SvgPicture.asset(
          "assets/icons/down_button.svg",
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 12, right: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kOutlineColor.withOpacity(0.25),
                width: 1,
              ),
            ),
            alignLabelWithHint: true,
            label: Text('Qty',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                )),
            disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
        value: number,
        onChanged: (value) => setState(
          () => number = value,
        ),
        items: dropDownNumbers.map(buildMenuItem).toList(),
      ),
    );
  }
}
