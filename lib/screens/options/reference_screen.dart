import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/declaration_screen.dart';
import 'package:test_1/utils/common_methods.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class ReferenceScreen extends StatefulWidget {
  const ReferenceScreen({Key? key}) : super(key: key);
  static String routeName = "/ReferenceScreen";

  @override
  State<ReferenceScreen> createState() => _ReferenceScreenState();
}

class _ReferenceScreenState extends State<ReferenceScreen> {
  final GlobalKey<FormState> referenceFormKey = GlobalKey<FormState>();

  final TextEditingController referenceNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.reference),
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
                        key: referenceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ConstantString.referenceName,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterNameFirst;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.referenceName = val;
                                });
                              },
                              controller: referenceNameController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.hintEnterprice,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.designation,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterDesignation;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.referenceDesignation = val;
                                });
                              },
                              controller: designationController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.hintMarketing,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.hintOrganize,
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
                                  Global.referenceOrganization = val;
                                });
                              },
                              controller: organizationController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.compeneyName,
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
                            if (referenceFormKey.currentState!.validate()) {
                              referenceFormKey.currentState!.save();

                              // setState(() => Navigator.of(context).pop());
                              Get.offAllNamed(DeclarationScreen.routeName);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.save),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            referenceFormKey.currentState!.reset();

                            referenceNameController.clear();
                            designationController.clear();
                            organizationController.clear();
                            setState(() {
                              Global.referenceName = null;
                              Global.referenceDesignation = null;
                              Global.referenceOrganization = null;
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
