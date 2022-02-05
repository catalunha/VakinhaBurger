import 'package:flutter/material.dart';

class AppAppbar extends AppBar {
  AppAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: 10,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        );
}
