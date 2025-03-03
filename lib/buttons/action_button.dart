import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lachi_app/logic/constants.dart';

//the main button of the app
//since its animated, its a stateful widget
class ActionButton extends StatefulWidget {
  const ActionButton(
      {Key? key,
      //checks for whether screen is portrait
      required this.height, //gets value of screen height
      required this.width, //gets value of screen width
      required this.actionText}) //the text of the button
      : super(key: key);

  final double height;
  final double width;
  final String actionText;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
    with SingleTickerProviderStateMixin {
  //add singletickerproviderstatemixin for all animations = tis a rule
  late AnimationController animationController; //essential for basic animations

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
    double scale = 1 -
        animationController
            .value; //my own custom variable that inverses the animationcontroller value
    return GestureDetector(
      //mapping all the functions
      onTap: tap,
      onTapDown: tapDown,
      onTapUp: tapUp,
      onTapCancel: tapUpCancel,
      child: Transform.scale(
        scale: scale, //transforms the child by scaling
        child: Container(
            constraints: const BoxConstraints(minHeight: 62),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: widget.width * 0.1,
                right: widget.width * 0.1,
                bottom: kNormalPadding(widget.height)),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Colors.black
                        .withOpacity(0.1 - (animationController.value * 2)))
              ], //neat trick to make shadow disappear
              borderRadius: BorderRadius.circular(5),
              color: kActionButtonColor,
            ),
            child: Text(widget.actionText,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryTextColor,
                ))),
      ),
    );
  }
}
