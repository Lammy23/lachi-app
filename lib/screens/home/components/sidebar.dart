import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  final bool isSidebarOpen = false;

  late Animation<Offset> animationOpen;
  late Animation<Offset> animationClose;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    animationOpen = Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationClose =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0.0)).animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Row(
              children: [
                SlideTransition(
                  position: animationClose,
                  child: Container(
                    color: Colors.black,
                    width: widget.width * 0.55,
                    height: widget.height,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
