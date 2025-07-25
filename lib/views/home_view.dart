import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';
import 'package:flutter_task/widgets/custom_button_app_bar.dart';
import 'package:flutter_task/widgets/furnture_item.dart';
import 'package:flutter_task/widgets/home_top_sec.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.name});
  final String name;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> imgs = [
    'https://cdn-icons-png.flaticon.com/512/182/182845.png',
    'https://cdn-icons-png.flaticon.com/512/182/182355.png',
    'https://cdn-icons-png.flaticon.com/512/4550/4550833.png',
    'https://cdn-icons-png.flaticon.com/512/182/182344.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                HomeTopSec(name: widget.name),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            4,
                            (index) => Image.network(
                              width: 70,
                              height: 80,
                              imgs[index],
                            ),
                          ),
                        ),
                        Divider(thickness: 2),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return FurntureItem(img: imgs[index]);
                            },
                            itemCount: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.325,
            right: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x60908383),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: AppTextStyles.kHomeSearch,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.kPrimaryColor,
                    size: 32,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
