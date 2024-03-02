// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../features/sign_in/sign_in.dart';

import '../../common/constants/constants.dart';
import '../../common/utils/utils.dart';
import '../../common/widgets/widgets.dart';
import '../../locator/locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with CustomModalSheetMixin {
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
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }

      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
        showCustomModalBottomSheet(
          context: context,
          content: (_controller.state as SignInErrorState).message,
          buttonText: "Try again",
        );
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
            Text('Sign up',
                style: AppTextStyles.smallText
                    .copyWith(color: AppColors.bluedarkThree)),
          ],
        ),
      ]),
    );
  }
}
