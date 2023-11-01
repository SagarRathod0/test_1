import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/technical_skills_screen.dart';
import 'package:test_1/utils/common_methods.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);
  static String routeName = "/ExperienceScreen";

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  final GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController experienceCollageController =
      TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController joinDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.experience),
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
                        key: experienceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ConstantString.compeneyName,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterCompenyName;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.experienceCompanyName = val;
                                });
                              },
                              controller: companyNameController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.compeneyName,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.degree, style: custTextStyle),
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
                                  Global.experienceCollage = val;
                                });
                              },
                              controller: experienceCollageController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.experienceHint,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.rollOption,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  Global.experienceRole = val;
                                });
                              },
                              maxLines: 3,
                              controller: roleController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.rollHint,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            const Text(
                              ConstantString.employedStatus,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            // Employed Status Radio Button
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value:
                                            ConstantString.previouslyEmployed,
                                        groupValue:
                                            Global.experienceEmployedStatus,
                                        onChanged: (val) {
                                          setState(() {
                                            Global.experienceEmployedStatus =
                                                val.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        ConstantString.previouslyEmployed,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: ConstantString.currentlyEmployed,
                                        groupValue:
                                            Global.experienceEmployedStatus,
                                        onChanged: (val) {
                                          setState(() {
                                            Global.experienceEmployedStatus =
                                                val.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        ConstantString.currentlyEmployed,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(color: Colors.grey, height: 1),
                            //Join Date Exit Date
                            SizedBox(height: height * 0.015),
                            Row(
                              children: [
                                // join Date
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        ConstantString.dateJoined,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return ConstantString.enterDate;
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          setState(() {
                                            Global.experienceJoinDate = val;
                                          });
                                        },
                                        keyboardType: TextInputType.datetime,
                                        controller: joinDateController,
                                        decoration: const InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: width * 0.05),
                                // Exit Date
                                Expanded(
                                  child: (Global.experienceEmployedStatus ==
                                          ConstantString.previouslyEmployed)
                                      ? Column(
                                          children: [
                                            const Text(
                                              ConstantString.exitJoined,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.01),
                                            TextFormField(
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return ConstantString
                                                      .enterExitDate;
                                                }
                                                return null;
                                              },
                                              onSaved: (val) {
                                                setState(() {
                                                  Global.experienceExitDate =
                                                      val;
                                                });
                                              },
                                              keyboardType:
                                                  TextInputType.datetime,
                                              controller: exitDateController,
                                              decoration: const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                alignLabelWithHint: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Save And Clear Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (experienceFormKey.currentState!.validate()) {
                              experienceFormKey.currentState!.save();

                              // setState(() => Navigator.of(context).pop());
                              Get.offAllNamed(TechnicalSkillsScreen.routeName);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.save),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            experienceFormKey.currentState!.reset();

                            companyNameController.clear();
                            experienceCollageController.clear();
                            roleController.clear();
                            setState(() {
                              Global.experienceCompanyName = null;
                              Global.experienceCollage = null;
                              Global.experienceRole = null;
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
