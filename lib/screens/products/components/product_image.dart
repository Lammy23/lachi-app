import 'package:flutter/material.dart';
import 'package:lachi_app/logic/constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.width,
    required this.isBlackProductPage,
    required this.height,
  }) : super(key: key);

  final double width;
  final bool isBlackProductPage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: width * 0.1,
          right: width * 0.1,
          bottom: kNormalPadding(height)),
      child: Image.asset(
        isBlackProductPage
            ? "assets/images/black_beans_peeler_bgremoved.png"
            : "assets/images/orange_beans_peeler_bgremoved.png",
        scale: 0.0005,
      ),
    );
  }
}
