// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mystock_app/common/utils/uppercase_text_formatter.dart';
import 'package:mystock_app/common/widgets/password_form_field.dart';
import 'package:mystock_app/features/sign_in/sign_in_controller.dart';
import 'package:mystock_app/features/sign_in/sign_in_state.dart';
import 'package:mystock_app/features/sign_up/sign_up_controller.dart';
import 'package:mystock_app/features/sign_up/sign_up_state.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_style.dart';
import '../../common/constants/routes.dart';
import '../../common/utils/validator.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_circular_progress_indicator.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_text_title.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';
import '../../locator/locator.dart';
import '../../services/mock_auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignInController>();
  @override
  void dispose() {
    ///Destrói nossos controllers
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
            context: context,
            builder: (context) => CustomCircularProgressIndicator());
      }
      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Scaffold(
                      body: Center(child: Text('Nova tela')),
                    ))));
      }

      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
        customModalBottomSheet(context, error.message, 'Tentar novamente');
      }
      log(_controller.state.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: AppColors.iceWhite,
          child: Column(
            children: [
              CustomTextTitle(),
              Image.asset(
                'assets/images/sign_in_image.png',
                height: 300,
              ),
            ],
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'email',
                  hintText: "email@email.com",
                  validator: (value) => Validator.validateEmail(value),
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'your password',
                  hintText: '****************',
                  validator: (value) => Validator.validatePassword(value),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16,
          ),
          child: PrimaryButton(
            text: 'Sign in',
            onPressed: () {
              final valid = _formKey.currentState != null &&
                  _formKey.currentState!.validate();

              if (valid) {
                ///lógica de login
                _controller.signIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
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
          onPressed: () =>
              Navigator.popAndPushNamed(context, NamedRoute.signUp),
          children: [
            Text("Don't have account?",
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
