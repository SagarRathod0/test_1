import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/constant/img_name.dart';
import 'package:test_1/screens/build_options_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.resumeBuilder),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(BuildOptionsScreen.routeName);
        },
        backgroundColor: ConstantColor.ff0475FF,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: width,
              alignment: const Alignment(0, 0.5),
              color: ConstantColor.ff0475FF,
              child: const Text(
                ConstantString.resumeBuilder,
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Column(
              children: [
                SizedBox(height: height * 0.07),
                Image.asset(
                  height: height * 0.07,
                  ImgName.cartbored,
                ),
                SizedBox(height: height * 0.03),
                const Text(
                  ConstantString.createNew,
                  style: TextStyle(fontSize: 21, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
