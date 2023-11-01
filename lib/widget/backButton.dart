import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/screens/build_options_screen.dart';

class BackBotton extends StatelessWidget {
  const BackBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(BuildOptionsScreen.routeName);
      },
      child: const Icon(Icons.arrow_back_ios_sharp),
    );
  }
}
