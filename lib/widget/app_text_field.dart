import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, required String label,
  }) : super(key: key);

  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: Colors.blueGrey, fontFamily: ''),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.blueAccent,
          ),
          enabledBorder: border(),
          focusedBorder: border(borderColor: Colors.blue),
          focusColor: Colors.blue),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.blueGrey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
