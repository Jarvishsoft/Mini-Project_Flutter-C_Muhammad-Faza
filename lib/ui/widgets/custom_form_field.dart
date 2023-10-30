import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    this.controller,
    this.hintText,
    this.onFieldTap,
    this.passwordMode = false,
    this.prefixIcon,
    this.validator,
    this.onSaved,
    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool passwordMode;
  final VoidCallback? onFieldTap;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.passwordMode ? _obscureText : false,
      maxLines: 1,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        fillColor: const Color(0xFFF4F4F4),
        filled: true,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.25),
          fontSize: 14,
        ),
        suffixIcon: widget.passwordMode
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black.withOpacity(0.25),
                ))
            : null,
      ),
    );
  }
}
