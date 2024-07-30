import 'package:exam_management_app/constants/constants.dart';
import 'package:exam_management_app/utils/global.colors.dart';
import 'package:exam_management_app/view/widgets/button.global.dart';
import 'package:exam_management_app/view/widgets/social.login.dart';
import 'package:exam_management_app/view/widgets/text.form.global.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                        LOGO,
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
                  'Create your account',
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
                  obscure: true,
                ),
                const SizedBox(height: 20),
                TextFormGlobal(
                  controller: confirmPasswordController,
                  text: 'Confirm Password',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 20),
                ButtonGlobal(
                  text: 'Sign Up',
                  onPressed: () {
                    // Handle sign up
                  },
                ),
                const SizedBox(height: 20),
                SocialLogin(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: () {
                        // Handle sign in navigation
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
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
