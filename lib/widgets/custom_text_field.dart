import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final IconData icon;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    this.obscureText = false,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        initialValue: initialValue,
        textCapitalization: TextCapitalization.words,
        style: const TextStyle(fontSize: 18),
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
