import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  // final String? label;
  // final String? hint;
  //final String? errorMessage;
  final Function(String)? onChanged;
  //final IconData? prefixIconData;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool autofocus;
  final bool? showCursor;
  final TextInputType? keyboardType;

  final InputDecoration decoration;

  const CustomTextFormField(
      {super.key,
      required this.decoration,
      //    this.label,
      //   this.hint,
      this.onChanged,
      this.validator,
      //  this.errorMessage,
      // this.prefixIconData,
      this.controller,
      this.showCursor,
      this.keyboardType,
      this.autofocus = false,
      this.obscureText = false});


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );

    if (controller != null) {
      controller!.addListener(
        () {
          final value = controller!.value.text;
          onChanged?.call(value);
        },
      );
    }

    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      showCursor: showCursor,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: decoration.copyWith(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          isDense: true),
      // decoration: InputDecoration(
      //   enabledBorder: border,
      //   focusedBorder:
      //       border.copyWith(borderSide: BorderSide(color: colors.primary)),
      //   errorBorder:
      //       border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
      //   focusedErrorBorder:
      //       border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
      //   isDense: true,
      //   label: label != null ? Text(label!) : null,
      //   hintText: hint,
      //   prefixIcon: prefixIconData != null ? Icon(prefixIconData) : null,
      //   errorText: errorMessage,
      // ),
    );
  }
}
