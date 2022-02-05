import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/core/ui/app_state.dart';
import 'package:introducao_flutter/app/core/ui/app_textformfield.dart';
import 'package:introducao_flutter/app/core/ui/app_theme.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends AppState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
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
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  const Text(
                      'Preencha os campos abaixo para criar o seu cadastro.'),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome obrigatório.'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFormField(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('email obrigatório.'),
                      Validatorless.email('Email inválido.'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  AppTextFormField(
                    label: 'Confirme senha',
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'confirmação de senha obrigatória.'),
                        Validatorless.min(6, 'Minimo de 6 caracteres.'),
                        Validatorless.compare(_passwordEC,
                            'Senha diferente do informado anteriormente.')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    label: 'Cadastrar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        log('formValid');
                        controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text);
                      } else {
                        log('formNotValid');
                      }
                    },
                    width: context.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
