import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';
import 'package:flutter_task/widgets/custom_elevated_button.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';
import 'package:flutter_task/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.kBackColor1, AppColors.kBackColor2],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.loginHeading,
                      style: AppTextStyles.kAuthTitle,
                    ),
                    Text(
                      AppStrings.loginSubHeading,
                      style: AppTextStyles.kAuthSubtitle,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Username',
                      controller: userController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      picon: Icons.person,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Paswword',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        } else if (value.length <= 6) {
                          return 'دي باسورد ترضي ربنا ؟';
                        }
                        return null;
                      },
                      picon: Icons.password,
                      visible: visible,
                      sicon: IconButton(
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                            // visible ? visible = false : visible = true;
                          });
                        },
                        icon:
                            visible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                      text: AppStrings.loginSignInTextButton,
                      formKey: formKey,
                      emailController: userController,
                      passwordController: passwordController,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.loginForgetPass,
                        style: AppTextStyles.kForgotPassword,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.loginDontHaveAcc,
                          style: AppTextStyles.kSignUpHint,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                          child: Text(
                            AppStrings.loginSignUpTextButton,
                            style: AppTextStyles.kSignUpLink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
