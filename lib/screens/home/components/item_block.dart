// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';
import 'package:lachi_app/screens/products/products_screen.dart';
import 'package:lachi_app/transitions/slide_transition.dart';

//block on homescreen
class ItemBlock extends StatefulWidget {
  const ItemBlock({
    Key? key,
    required this.width,
    required this.height,
    required this.image, //grabs image from assets and displays accordingly
    required this.color,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  final String color;
  @override
  State<ItemBlock> createState() => _ItemBlockState();
}

class _ItemBlockState extends State<ItemBlock>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late bool
      isBlackProductPage; //provides the color of the product so that it knows where to go when tapped

  @override
  void initState() {
    //basic animation stuff
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 50),
        lowerBound: 0.0,
        upperBound: 0.05)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  void tap() {
    widget.image == "assets/images/black_beans_peeler.png" //code for navigation
        ? isBlackProductPage = true
        : isBlackProductPage = false;
    animationController!.forward();

    Future.delayed(const Duration(milliseconds: 80), () {
      animationController!.reverse();
      Navigator.push(
          //neat trick to go to another page
          context,
          SlidePageTransition(
              widget: ProductsScreen(isBlackProductPage: isBlackProductPage)));
    });
  }

  void tapDown(TapDownDetails details) {
    animationController!.forward();
  }

  void tapUp(TapUpDetails details) {
    animationController!.reverse();
  }

  void tapUpCancel() {
    animationController!.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - animationController!.value;
    return GestureDetector(
      onTap: tap,
      onTapDown: tapDown,
      onTapUp: tapUp,
      onTapCancel: tapUpCancel,
      child: Transform.scale(
        scale: scale,
        child: Container(
          margin: EdgeInsets.fromLTRB(kDefaultMargin(widget.width), 0,
              kDefaultMargin(widget.width), kEdgePadding(widget.height)),
          child: AspectRatio(
            // really good widget for images
            aspectRatio: 1.18,
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0.5),
                        blurRadius: 5,
                        spreadRadius: 5,
                        color: Colors.black.withOpacity(
                            0.1 - (animationController!.value * 2)))
                  ],
                )),
                Image.asset(
                  widget.image,
                  scale: 0.00005,
                ),
                Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0x66000000),
                )),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: 205,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: const Color(0x00c4c4c4),
                    ),
                    child: Text(
                      widget.color,
                      style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: kbuttonWeight),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
