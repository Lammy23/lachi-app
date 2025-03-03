import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({Key? key, required this.productColor}) : super(key: key);
  final String productColor;
  @override
  DeleteButtonState createState() => DeleteButtonState();
}

class DeleteButtonState extends State<DeleteButton> {
  removeColor() {
    setState(() {
      if (widget.productColor == 'black') {
        while (cartList.contains('black')) {
          for (int i = 0; i < cartList.length; i++) {
            if (cartList[i] == 'black') {
              cartList.removeAt(i);
            }
          }
        }
      } else {
        while (cartList.contains('orange')) {
          for (int i = 0; i < cartList.length; i++) {
            if (cartList[i] == 'orange') {
              cartList.removeAt(i);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          removeColor();
          updatePrice();
          updateTotalCart();
        });
      },
      child: Text("Delete",
          style: GoogleFonts.openSans(
            color: kPrimaryTextColor.withOpacity(0.5),
            decoration: TextDecoration.underline,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          )),
    );
  }
}
