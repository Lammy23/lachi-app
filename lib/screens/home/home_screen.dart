import 'package:flutter/material.dart';

import 'package:lachi_app/shared_components/app_bar.dart';

import 'components/item_block.dart';
import 'components/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
//the homescreen
  @override
  Widget build(BuildContext context) {
    String screen =
        "home_screen"; //so that appbar knows and can change accordingly
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        drawer: Drawer(
          //very easy method for sidebar
          child: SideBar(width: width, height: height),
        ),
        //only has three items, pretty straight forward
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            LachiAppBar(
              screen: screen,
              height: height,
              width: width,
            ),
            ItemBlock(
                color: "Shop Black",
                image: "assets/images/black_beans_peeler.png",
                width: width,
                height: height),
            ItemBlock(
                color: "Shop Orange",
                image: "assets/images/orange_beans_peeler.png",
                width: width,
                height: height)
          ]),
        ));
  }
}
