import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/core/ui/app_state.dart';
import 'package:introducao_flutter/app/core/ui/app_textformfield.dart';
import 'package:introducao_flutter/app/core/ui/app_theme.dart';
import 'package:introducao_flutter/app/modules/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailEC.text = 'catalunhamj@gmail.com';
    _passwordEC.text = '456456';
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constrainsts) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrainsts.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppTextFormField(
                          label: 'E-Mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('email obrigatório.'),
                            Validatorless.email('Email inválido.'),
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AppTextFormField(
                          label: 'Senha',
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória.'),
                            Validatorless.min(6, 'Minimo de 6 caracteres.'),
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AppButton(
                          label: 'Acessar',
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;
                            if (formValid) {
                              log('formValid');
                              controller.login(
                                  email: _emailEC.text,
                                  password: _passwordEC.text);
                            } else {
                              log('formNotValid');
                            }
                          },
                          width: context.width,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta ?'),
                            TextButton(
                              onPressed: () {
                                Get.toNamed("/register");
                              },
                              child: const Text(
                                'Cadastre-se.',
                                style: AppTheme.textBold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
