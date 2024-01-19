import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final void Function(String)? onFieldSubmited;
  final FocusNode focusNode;
  final String label;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  const CustomTextFieldWidget({
    super.key,
    required this.textEditingController,
    this.isPassword = false,
    required this.onFieldSubmited,
    required this.focusNode,
    required this.label,
    required this.validator,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      obscureText: isPassword,
      autocorrect: false,
      onFieldSubmitted: onFieldSubmited,
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
