import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/Screen/login_screen.dart';
import 'package:instagram/resources/auth_method.dart';
import 'package:instagram/utils/utils.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        fullName: _fullNameController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    }
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(child: Container(), flex: 1),
            //svg image
            SvgPicture.asset(
              'assests/ic_instagram.svg',
              color: Colors.blue,
              height: 60,
            ),
            const SizedBox(height: 60),

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
              hintText: "Enter your Password",
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
              onTap: signUpUser,
              child: Container(
                // ignore: sort_child_properties_last
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : const Text('Sign up'),
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
            Flexible(child: Container(), flex: 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Already have an account?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        // decorationStyle: TextDecorationStyle.solid,
                        // decorationColor: Colors.pink,
                        decorationThickness: 2,
                        color: Colors.blue,
                        fontSize: 15,
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
