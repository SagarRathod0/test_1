import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/education_screen.dart';
import 'package:test_1/utils/common_methods.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);
  static String routeName = "/PersonalDetailsScreen";

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final GlobalKey<FormState> personalDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  bool? maritalStatues;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.personalDetails),
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 30),
                      child: Form(
                        key: personalDetailsFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ConstantString.dob, style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterDateBirth;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.dateOfBirth = val;
                                });
                              },
                              keyboardType: TextInputType.datetime,
                              controller: dateOfBirthController,
                              decoration: const InputDecoration(
                                hintText: "DD/MM/YYYY",
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.maritalStatus,
                                style: custTextStyle),
                            RadioListTile(
                              title: const Text(ConstantString.single),
                              value: ConstantString.single,
                              contentPadding: const EdgeInsets.all(0),
                              groupValue: Global.maritalStatus,
                              onChanged: (val) {
                                setState(() {
                                  Global.maritalStatus = val.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text(ConstantString.married),
                              value: ConstantString.married,
                              contentPadding: const EdgeInsets.all(0),
                              groupValue: Global.maritalStatus,
                              onChanged: (val) {
                                setState(() {
                                  Global.maritalStatus = val.toString();
                                });
                              },
                            ),
                            Text(ConstantString.languagesKnown,
                                style: custTextStyle),
                            SizedBox(height: height * 0.01),
                            //Check Box
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.englishCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.englishCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text(ConstantString.english)
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.hindiCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.hindiCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text(ConstantString.hindi)
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.gujratiCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.gujratiCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text(ConstantString.gujrati),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.nationality,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterNationality;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.nationality = val;
                                });
                              },
                              controller: nationalityController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.indian,
                                alignLabelWithHint: true,
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
                            if (personalDetailsFormKey.currentState!
                                .validate()) {
                              personalDetailsFormKey.currentState!.save();
                              // setState(() => Navigator.of(context).pop());
                              Get.offAllNamed(EducationScreen.routeName);
                            }
                            print("${Global.englishCheckBox}");
                            print("${Global.hindiCheckBox}");
                            print("${Global.gujratiCheckBox}");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.save),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            personalDetailsFormKey.currentState!.reset();

                            dateOfBirthController.clear();
                            nationalityController.clear();
                            setState(() {
                              Global.dateOfBirth = null;
                              Global.maritalStatus = null;
                              Global.nationality = null;
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
