import 'package:flutter/material.dart';
import 'package:flutter_task/custom_text_field.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login'),
            SizedBox(height: 20),
            CustomTextField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                } else if (!value.contains('@gmail')) {
                  return 'دخل ايميل عدل يجدع انت';
                }
                return null;
              },
              picon: Icons.email,
            ),
            SizedBox(height: 20),
            CustomTextField(
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
                    visible ? visible = false : visible = true;
                  });
                },
                icon:
                    visible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Column(
                        children: [
                          Text('جدع يا حماده تم اصطياد الاكونت الخااص بك'),
                          Text('email : ${emailController.text}'),
                          Text('pass : ${passwordController.text}'),
                        ],
                      ),
                    ),
                  );
                  emailController.clear();
                  passwordController.clear();
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
