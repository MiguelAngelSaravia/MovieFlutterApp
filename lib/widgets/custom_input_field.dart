import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    super.key, 
    this.hintText, 
    this.labelText,
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.keyboardType, 
    this.obscureText = false, 
    required this.formProperty, 
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: ( value ) => formValues[formProperty] = value,
      validator: (value) {
        if ( value == null ) return 'requerido';
        return value.length < 3 ? 'Minimo 3 lestras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
       //  counterText: '${counterLabel.length}/255',
       counterText: '0/255',
        suffixIcon: suffixIcon == null ? null : Icon( suffixIcon ),
        icon: icon == null ? null : Icon( icon ),
      ),
    );
  }
}