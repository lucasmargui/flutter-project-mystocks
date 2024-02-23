// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutablesm, sort_child_properties_last

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystock_app/common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  const PasswordFormField(
      {Key? key, this.controller, this.padding, this.hintText, this.labelText})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      //Se controller de PassworFormField for nulo
      //significa que controller de CustomTextFormField também será
      controller: widget.controller,

      //Se valor de padding de PassworFormField for Nulo
      //significa que Valor de CustomTextFormField também será fazendo aquela verificação de ?? em CustomTextFormField
      padding: widget.padding,

      obscureText: isHidden,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
        ),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
