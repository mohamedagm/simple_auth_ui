import 'package:flutter/material.dart';
import 'package:flutter_task/custom_text_field.dart';
import 'package:flutter_task/register_view.dart';
import 'package:flutter_task/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            colors: [Color(0xFF9B28B2), Color(0xFFE3A7F4), Color(0xFFFCE4EC)],
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
                    Text('Welcome Back', style: Styles.kLoginTitle),
                    Text(
                      'Enter your credintial to login',
                      style: Styles.kLoginSubtitle,
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff9B28B2),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width - 30,
                          60,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'جدع يا حماده تم اصطياد الاكونت الخااص بك\n'
                                'email: ${emailController.text}\n'
                                'pass: ${passwordController.text}',
                              ),
                            ),
                          );
                          emailController.clear();
                          passwordController.clear();
                        }
                      },
                      child: Text('Login', style: Styles.kButtonText),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'forgot password ?',
                        style: Styles.kForgotPassword,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Styles.kSignUpHint,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                          child: Text('Sign Up', style: Styles.kSignUpLink),
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
