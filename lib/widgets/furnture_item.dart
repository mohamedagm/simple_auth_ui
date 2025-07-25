import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';

class FurntureItem extends StatefulWidget {
  const FurntureItem({super.key, required this.img});
  final String img;

  @override
  State<FurntureItem> createState() => _FurntureItemState();
}

class _FurntureItemState extends State<FurntureItem> {
  bool isLoved = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        spacing: 15,
        children: [
          SizedBox(height: 150, child: Image.network(widget.img)),
          Expanded(
            child: Column(
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppStrings.titleblabla,
                      style: AppTextStyles.kHomeTitleItem,
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: isLoved ? Colors.red : Colors.grey[400],
                      onPressed: () {
                        setState(() {
                          isLoved = !isLoved;
                        });
                      },
                      iconSize: 24,
                    ),
                  ],
                ),
                Text(
                  AppStrings.blablabla,
                  maxLines: 4,
                  style: AppTextStyles.kHomeDescItem,
                ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor2,
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () {},
                      child: Text(AppStrings.homePrice),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () {},
                      child: Text(AppStrings.homeAddToCard),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
