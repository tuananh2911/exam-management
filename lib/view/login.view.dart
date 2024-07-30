import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/widgets/button.global.dart';
import 'package:exam_management_app/view/widgets/social.login.dart';
import 'package:exam_management_app/view/widgets/text.form.global.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset('assets/images/grade.png', height: 80),
                      const SizedBox(height: 20),
                      Text(
                        'MarkEasy',
                        style: TextStyle(
                          color: GlobalColors().mainColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: GlobalColors().mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                    controller: passwordController,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true),
                const SizedBox(height: 20),
                ButtonGlobal(
                  text: 'Sign in',
                  onPressed: () {
                    // Handle sign in
                  },
                ),
                const SizedBox(height: 20),
                SocialLogin(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    InkWell(
                      onTap: () {
                        // Handle sign up
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: GlobalColors().mainColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
