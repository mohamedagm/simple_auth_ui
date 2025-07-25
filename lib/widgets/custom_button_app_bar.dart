import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int curIndex = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.favorite_outline,
    Icons.local_mall_outlined,
    Icons.notifications,
    Icons.person,
  ];
  List<String> titles = ["Home", "Fav", "Shop", "Alerts", "Profile"];
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 60,
      style: TabStyle.react,
      backgroundColor: Colors.white,
      activeColor: AppColors.kPrimaryColor,
      initialActiveIndex: 0,
      color: Colors.grey,
      curveSize: 85,
      top: -20,
      elevation: 5,
      items: List.generate(
        5,
        (index) => TabItem(
          icon: Icon(
            icons[index],
            color: colorCheckHomeBottom(index, curIndex),
          ),
          title: titles[index],
        ),
      ),
      onTap:
          (index) => setState(() {
            curIndex = index;
          }),
    );
  }

  Color colorCheckHomeBottom(index, curIndex) =>
      curIndex == index ? AppColors.kPrimaryColor : Colors.black;
}
