import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.picon,
    this.sicon,
    this.visible,
    this.hintText,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData picon;
  final IconButton? sicon;
  final bool? visible;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        prefixIcon: Icon(picon),
        suffixIcon: sicon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      ),
    );
  }
}
