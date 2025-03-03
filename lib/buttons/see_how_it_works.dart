import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

class SeeHowItWorks extends StatefulWidget {
  const SeeHowItWorks({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  State<SeeHowItWorks> createState() => _SeeHowItWorksState();
}

class _SeeHowItWorksState extends State<SeeHowItWorks>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync:
            this, //helps render only whats displayed on the screen and not offscreen objects
        duration: const Duration(
            milliseconds:
                50), //duration of animation.forward() and animation.reverse()
        lowerBound:
            0.0, //animationcontroller basically generates a bunch of numbers withing a timeframe. apply these numbers as you will
        upperBound: 0.05)
      ..addListener(() {
        //not sure
        setState(() {});
      });
    super.initState(); //this line just has to be here \_(*confusedface*)_/
  }

  @override
  void dispose() {
    //you always have to get rid of the animation since its really demanding (nearly killed my laptop)
    super.dispose();
    animationController.dispose();
  }

  void tap() {
    animationController.forward(); //animation plays forward
    Future.delayed(const Duration(milliseconds: 80), () {
      //delay for a while
      animationController.reverse(); //animation plays in reverse
    });
  }

  void tapDown(TapDownDetails details) {
    //what happens of long press kinda
    animationController.forward();
  }

  void tapUp(TapUpDetails details) {
    //what happens when your release the press
    animationController.reverse();
  }

  void tapUpCancel() {
    //what happens when you try to be funny
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - animationController.value;
    return GestureDetector(
      onTap: tap,
      onTapDown: tapDown,
      onTapUp: tapUp,
      onTapCancel: tapUpCancel,
      child: Transform.scale(
        scale: scale,
        child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: kDefaultMargin(widget.width),
                right: kDefaultMargin(widget.width),
                bottom: kNormalPadding(widget.height)),
            width: double.infinity,
            height: 62,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("See how it works",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryTextColor.withOpacity(0.8),
                ))),
      ),
    );
  }
}
