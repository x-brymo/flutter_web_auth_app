import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFeild extends StatelessWidget {
   CustomTextFeild({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.keyboardType,
    this.mask,
    this.readOnly,this.scuX,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
   bool? scuX = false;
  final String? Function(String?)? validator;
   bool? readOnly = false;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? mask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: mask,
        controller: controller,
        obscureText: scuX!,
        validator: validator,
        readOnly: readOnly!,
        onChanged: onChanged,
        onSaved: onSaved,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabled: true,
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(), focusedErrorBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
