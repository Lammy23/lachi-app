import 'package:flutter/material.dart';
import 'package:lachi_app/buttons/see_how_it_works.dart';
import 'package:lachi_app/logic/checkout_logic.dart';
import 'package:lachi_app/logic/constants.dart';
import 'package:lachi_app/screens/products/components/add_to_cart_button.dart';

import 'package:lachi_app/shared_components/app_bar.dart';
import 'package:lachi_app/shared_components/stock_indicator.dart';

import '../../shared_components/bold_header.dart';
import 'components/product_description.dart';
import 'components/product_image.dart';
import '../../buttons/quantity_selector.dart';

//products screen
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, required this.isBlackProductPage})
      : super(key: key);
  final bool isBlackProductPage;

  @override
  Widget build(BuildContext context) {
    String screen = "products_screen";
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), //for smooth scrolling physics
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LachiAppBar(height: height, width: width, screen: screen),
            BoldHeader(text: "3-in-one", width: width, height: height),
            ProductImage(
              isBlackProductPage: isBlackProductPage,
              height: height,
              width: width,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoldHeader(
                        text: "N$productPriceString",
                        width: width,
                        height: height),
                    QuantitySelector(
                        isBlack: isBlackProductPage,
                        width: width,
                        height: height),
                  ]),
            ),
            StockIndicator(width: width, height: height),
            AddToCartButton(
                isBlack: isBlackProductPage,
                actionText: "Add to cart",
                height: height,
                width: width),
            SeeHowItWorks(height: height, width: width),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
              ),
              margin: EdgeInsets.only(
                  bottom: kNormalPadding(height),
                  right: kDefaultMargin(width),
                  left: kDefaultMargin(width)),
              width: double.infinity,
              height: 0.5,
            ),
            ProductDescription(width: width, height: height)
          ],
        ),
      ),
    );
  }
}
