import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final bool obSecureText;
  final String hintText;
  final IconData prefixIcon;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obSecureText,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obSecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: Colors.brown),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon)

        ),
      ),
    );
  }
}
