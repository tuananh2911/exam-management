import 'dart:async';

import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/login.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget{
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),(){
      Get.to(LoginView());
    });
      return  Scaffold(
        backgroundColor: GlobalColors().mainColor,
        body: const Center(child: Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )),
      );
  }
}