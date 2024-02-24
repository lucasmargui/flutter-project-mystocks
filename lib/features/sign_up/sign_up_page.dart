// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mystock_app/common/utils/uppercase_text_formatter.dart';
import 'package:mystock_app/common/widgets/password_form_field.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/utils/validator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text('Spend Smarter',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.bluedarkOne)),
        Text('Save More',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText
                .copyWith(color: AppColors.bluedarkOne)),
        Image.asset('assets/images/sign_up_image.png'),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'your name',
                  hintText: "LUCAS MARTINS",
                  inputFormatters: [UpperCaseTextInputFormatter()],
                  validator: (value) => Validator.validateName(value),
                ),
                CustomTextFormField(
                  labelText: 'email',
                  hintText: "email@email.com",
                  validator: (value) => Validator.validateEmail(value),
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'choose your password',
                  hintText: '****************',
                  helperText:
                      'Must have at least 8 characters, 1 capital letter and 1 number',
                  validator: (value) => Validator.validatePassword(value),
                ),
                PasswordFormField(
                  labelText: 'Confirm your password',
                  hintText: '****************',
                  validator: (value) => Validator.validateConfirmPassword(
                      value, _passwordController.text),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16,
          ),
          child: PrimaryButton(
            text: 'Sign Up',
            onPressed: () {
              final valid = _formKey.currentState != null &&
                  _formKey.currentState!.validate();

              if (valid) {
                log("continuar lógica de login");
              } else {
                log("erro ao logar");
              }
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MultiTextButton(
          onPressed: () => log('message'),
          children: [
            Text('Already have account?',
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.grey,
                )),
            Text('Log In',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.bluedarkThree)),
          ],
        ),
      ]),
    );
  }
}
