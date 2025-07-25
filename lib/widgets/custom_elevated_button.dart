import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';
import 'package:flutter_task/views/home_view.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.text,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppStrings.authSnackBar),
              backgroundColor: AppColors.kPrimaryColor,
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeView(name: emailController.text),
            ),
          );
        }
      },
      child: Text(text, style: AppTextStyles.kButtonText),
    );
  }
}
