import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/experience_screen.dart';
import 'package:test_1/utils/common_methods.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);
  static String routeName = "/EducationScreen";

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();

  final TextEditingController courseController = TextEditingController();
  final TextEditingController collageController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController passYearController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.eucation),
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
              color: const Color(0xffEDEDED),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 20, right: 20, left: 20),
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: educationFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ConstantString.degree, style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterdegree;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.course = val;
                                });
                              },
                              controller: courseController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.hintEducation,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.hintEducation,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterSchool;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.collage = val;
                                });
                              },
                              controller: collageController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.enterSchool,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.enterSchool,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterMarks;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.marks = val;
                                });
                              },
                              controller: marksController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.hintMark,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.yearOfPass,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterPassYears;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.passYear = val;
                                });
                              },
                              keyboardType: TextInputType.number,
                              controller: passYearController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.year2023,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (educationFormKey.currentState!.validate()) {
                              educationFormKey.currentState!.save();

                              // setState(() => Navigator.of(context).pop());
                              Get.offAllNamed(ExperienceScreen.routeName);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.save),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            educationFormKey.currentState!.reset();

                            courseController.clear();
                            collageController.clear();
                            marksController.clear();
                            passYearController.clear();
                            setState(() {
                              Global.course = null;
                              Global.collage = null;
                              Global.marks = null;
                              Global.passYear = null;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.clear),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
