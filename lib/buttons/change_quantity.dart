// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';

class ChangeQuantity extends StatefulWidget {
  ChangeQuantity({
    Key? key,
    required this.amount,
    required this.height,
    required this.width,
    required this.isBlack,
  }) : super(key: key);

  int amount;
  final double height;
  final double width;
  final bool isBlack;
  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  void plusTap() {
    setState(() {
      widget.isBlack ? incrementBlackNumber() : incrementOrangeNumber();
      updateTotalCart();
      updatePrice();
    });
  }

  void minusTap() {
    setState(() {
      widget.isBlack ? decrementBlackNumber() : decrementOrangeNumber();
      updateTotalCart();
      updatePrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: minusTap, child: const Icon(Icons.remove)),
        Container(width: 5),
        Container(
            constraints: const BoxConstraints(minHeight: 36, minWidth: 36),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: kOutlineColor,
                  width: 1.5,
                )),
            child: Text(
                widget.isBlack
                    ? countBlack().toString()
                    : countOrange().toString(),
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ))),
        Container(width: 5),
        GestureDetector(onTap: plusTap, child: const Icon(Icons.add))
      ],
    );
  }
}
