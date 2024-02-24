// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  //EdgeInsetsGeometry? pode ser nulo
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.suffixIcon,
    this.obscureText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.bluedarkOne));

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Pegando o valor de padding da classe superior widget CustomTextFormField
      // ?? = verificador de nulabilidade,
      // se ele não for nulo utilizará o valor de widget.padding que foi passado
      // se ele for nulo então tilizará o valor passado de EdgeInsets.symmetric
      padding:
          widget.padding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        style: AppTextStyles.inputText.copyWith(color: AppColors.grey),
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //necessário ? pois toUpperCase é uma função que não pode ser invocada se labelText for nulo
          //então só invocará a função se o valor widget.labelText não for nulo
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText
              .copyWith(color: AppColors.bluedarkOne),
          border: defaultBorder,
          focusedBorder: defaultBorder.copyWith(
              borderSide: BorderSide(color: AppColors.grey)),
          errorBorder: defaultBorder,
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
