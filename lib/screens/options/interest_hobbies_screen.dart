import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/projects_screen.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class InterestHobbiesScreen extends StatefulWidget {
  const InterestHobbiesScreen({Key? key}) : super(key: key);
  static String routeName = "/InterestHobbiesScreen";

  @override
  State<InterestHobbiesScreen> createState() => _InterestHobbiesScreenState();
}

class _InterestHobbiesScreenState extends State<InterestHobbiesScreen> {
  List allTextFildList = [];
  List<TextEditingController> allControllers = [];
  @override
  void initState() {
    super.initState();

    allControllers.add(TextEditingController());
    allControllers.add(TextEditingController());

    allTextFildList.add(getTextFild(i: 0, row: const Row()));
    allTextFildList.add(getTextFild(i: 1, row: const Row()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.interest),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: width,
              alignment: const Alignment(0, 0.5),
              color: ConstantColor.ff0475FF,
            ),
          ),
          Expanded(
            flex: 18,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xffEDEDED),
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      Text(
                        ConstantString.enterIntrest,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      ...allTextFildList
                          .map((e) => getTextFild(
                              i: allTextFildList.indexOf(e), row: e))
                          .toList(),
                      SizedBox(height: height * 0.06),
                      SizedBox(
                        height: height * 0.055,
                        width: width,
                        child: OutlinedButton(
                          child: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              allControllers.add(TextEditingController());
                              allTextFildList.add(getTextFild(
                                  i: allTextFildList.length, row: const Row()));
                            });
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Navigator.pop(context);
                            Get.offAllNamed(ProjectsScreen.routeName);
                          });
                          for (var element in allControllers) {
                            Global.interestHobbies.add(element.text.toString());
                          }
                          print(Global.interestHobbies);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ConstantColor.ff0475FF,
                        ),
                        child: const Text(ConstantString.save),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row getTextFild({required i, required Row row}) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            controller: allControllers[i],
            decoration: InputDecoration(
              hintText: ConstantString.hobbiHint,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            setState(() {
              allControllers.removeAt(i);
              allTextFildList.remove(row);
            });
          },
        ),
      ],
    );
  }
}
