import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Image.network(
            'https://static.vecteezy.com/system/resources/previews/052/120/539/non_2x/simple-male-avatar-silhouette-icon-man-with-short-hair-user-profiles-and-contact-information-in-applications-isolated-illustration-vector.jpg',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.white, size: 32),
        ),
      ],
    );
  }
}
