import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';
import 'package:flutter_task/widgets/custom_app_bar.dart';

class HomeTopSec extends StatelessWidget {
  const HomeTopSec({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(shape: BoxShape.rectangle),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: MediaQuery.of(context).size.height * 0.05,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Text(
              '${AppStrings.homeHello}$name',
              style: AppTextStyles.kHomeHello,
            ),
            Text(AppStrings.homeSubHello, style: AppTextStyles.kHomeSubHello),
          ],
        ),
      ),
    );
  }
}
