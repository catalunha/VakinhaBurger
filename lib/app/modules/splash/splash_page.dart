import 'package:flutter/material.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .15,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    // fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  AppButton(
                    label: 'Bem vindo.',
                    onPressed: () {
                      controller.checkLogged();
                    },
                    width: context.widthTransformer(reducedBy: 40),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
