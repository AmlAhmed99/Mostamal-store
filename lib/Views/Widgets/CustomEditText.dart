import 'package:flutter/material.dart';

class defaultFormField extends StatelessWidget {

  TextEditingController? controller;
  TextInputType? type;
  String? label;
  Widget? prefix;
  Widget? suffix;
  bool obscuretext;
  final Function validator;
  Function?  onTap;
  Function?  onChanged;
  Function?  onFieldSubmitted;

  defaultFormField(
      {
        required this.type,
         this.controller,
        required this.label,
         this.prefix,
         this.suffix,
         this.obscuretext = false,
        required this.validator,
         this.onTap,
         this.onChanged,
         this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      obscureText: obscuretext,
        validator:(str) {
         return validator(str);
        },
     // onTap: onTap,
      //onChanged: onChanged;
      //onFieldSubmitted:onFieldSubmitted;
    );
  }
}
