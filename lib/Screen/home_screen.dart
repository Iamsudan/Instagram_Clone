import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/Screen/login_screen.dart';
import 'package:instagram/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          // title: const Text('Instagram'),
          actions: [
            IconButton(
                onPressed: () => const LoginScreen(),
                icon: const ImageIcon(AssetImage(
                  'assests/ins.png',
                ))),
            IconButton(
                onPressed: () => const LoginScreen(),
                icon: const ImageIcon(AssetImage('assests/messenger.png')))
          ],
        ),
        body: Container());
  }
}
