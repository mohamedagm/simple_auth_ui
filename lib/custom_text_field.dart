import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.picon,
    this.sicon,
    this.visible,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData picon;
  final IconButton? sicon;
  final bool? visible;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(picon),
        suffixIcon: sicon,
        border: OutlineInputBorder(),
      ),
    );
  }
}
