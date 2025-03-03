import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//checkout logic

//integers
int kProductPrice = 65000; // price of product
int numberToCart = 0; //number being added to cart

//strings
String productPriceString = kProductPrice.toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
String? number;
String blackPrice = '0'; //price of black
String orangePrice = '0'; //price of orange
String formattedBlackPrice = '0'; // formatted versions
String formattedOrangePrice = '0';

//functions
incrementOrangeNumber() {
  cartList.add("orange");
  countOrange();
}

decrementOrangeNumber() {
  cartList.remove("orange");
  countOrange();
}

incrementBlackNumber() {
  cartList.add("black");
  countBlack();
}

decrementBlackNumber() {
  cartList.remove("black");
  countBlack();
}

countBlack() {
  //counts number of black products
  int blackNumber = 0;
  for (int i = 0; i < cartList.length; i++) {
    if ("black" == cartList[i]) {
      blackNumber++;
    }
  }
  return blackNumber;
}

countOrange() {
  // counts number of orange
  int orangeNumber = 0;
  for (int i = 0; i < cartList.length; i++) {
    if ("orange" == cartList[i]) {
      orangeNumber++;
    }
  }
  return orangeNumber;
}

updateTotalCart() {
  //updates the notifier of amount in cart
  cartTotal.value =
      cartList.length; //make sure you add .value ohh chineke moh ohh!

  cartHasOrange.value = countOrange() > 0;
  cartHasBlack.value = countBlack() > 0;
}

updatePrice() {
  blackPrice = (countBlack() * kProductPrice).toString();
  orangePrice = (countOrange() * kProductPrice).toString();

  formattedBlackPrice = blackPrice.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");

  formattedOrangePrice = orangePrice.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");

  formattedTotalPrice.value = (int.parse(blackPrice) + int.parse(orangePrice))
      .toString()
      .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
  blackPriceTag.value = formattedBlackPrice;
  orangePriceTag.value = formattedOrangePrice;
}

//value notifiers
final ValueNotifier<int> cartTotal = ValueNotifier<int>(0);
final ValueNotifier<String> blackPriceTag = ValueNotifier<String>('0');
final ValueNotifier<String> orangePriceTag = ValueNotifier<String>('0');
ValueNotifier<String> formattedTotalPrice = ValueNotifier('0');

//booleans
bool blockIsBlack = false;
String color = blockIsBlack ? "black" : "orange";
ValueNotifier<bool> cartHasOrange = ValueNotifier(false);
ValueNotifier<bool> cartHasBlack = ValueNotifier(false);

//lists
List cartList = <String>[];
final dropDownNumbers = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',
  '32',
  '33',
  '34',
  '35',
  '36',
  '37',
  '38',
  '39',
  '40',
  '41',
  '42',
  '43',
  '44',
  '45',
  '46',
  '47',
  '48',
  '49',
  '50',
  '75',
  '100',
  '125',
  '150',
  '155',
  '200',
  '500',
  '750',
  '1000'
];
