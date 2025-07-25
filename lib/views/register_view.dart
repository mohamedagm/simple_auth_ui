import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/theme/app_text_styles.dart';
import 'package:flutter_task/widgets/custom_elevated_button.dart';
import 'package:flutter_task/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool visible = false;
  @override
  void dispose() {
    emailController.dispose();
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
                      AppStrings.registerHeading,
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
                      hintText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        } else if (!value.contains('@gmail')) {
                          return 'دخل الايميل عدل يجدع انت';
                        }
                        return null;
                      },
                      picon: Icons.email,
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
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Confirm Paswword',
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        } else if (value != passwordController.text) {
                          return 'لازم تبقي شبه الي فوقيها';
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
                      text: AppStrings.registerTextButton,
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: Divider(thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            AppStrings.orSignInWith,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(child: Divider(thickness: 1)),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width - 50,
                          45,
                        ),
                      ),
                      onPressed: () {
                        // service->repo->cubit
                      },
                      child: Text(
                        AppStrings.registerSignInGoogle,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.registerHaveAcc,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            AppStrings.registerSignInTextButton,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kPrimaryColor,
                            ),
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
