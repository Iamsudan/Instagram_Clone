import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 1),
            //svg image
            SvgPicture.asset(
              'assests/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(height: 64),

            //Text field
            TextFieldInput(
                textEditingController: _emailController,
                hintText: "Mobile or email",
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 25,
            ),

            TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Username",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 25,
            ),

            TextFieldInput(
                textEditingController: _fullNameController,
                hintText: "Full Name",
                textInputType: TextInputType.text),
            const SizedBox(
              height: 25,
            ),

            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter youy Password",
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 30,
            ),
            //login button
            const Text(
              "By signing up, you agree to our Terms , Privacy Policy and Cookies Policy .",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),

            const SizedBox(
              height: 25,
            ),
            InkWell(
              onDoubleTap: () {},
              child: Container(
                child: const Text('Sign up'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(child: Container(), flex: 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}