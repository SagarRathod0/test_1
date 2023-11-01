import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/achievement_screen.dart';
import 'package:test_1/utils/common_methods.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);
  static String routeName = "/ProjectsScreen";

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final GlobalKey<FormState> projectFormKey = GlobalKey<FormState>();

  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController rolesController = TextEditingController();
  final TextEditingController technologiesController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.projects),
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
                        key: projectFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ConstantString.projectsTile,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterProject;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectTitle = val;
                                });
                              },
                              controller: projectTitleController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.resumeBuilderApp,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.technologies,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            // Chake Box
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxCProgramming,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxCProgramming =
                                            val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  ConstantString.cProgramming,
                                  style: custTextStyleForChackBox,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxCPP,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxCPP = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  ConstantString.cPlus,
                                  style: custTextStyleForChackBox,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.projectCheckBoxFlutter,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.projectCheckBoxFlutter = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  ConstantString.flutter,
                                  style: custTextStyleForChackBox,
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.roles, style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterProject;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectRoles = val;
                                });
                              },
                              maxLines: 2,
                              controller: rolesController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.hintOrganize,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.technologies,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterTechnologies;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectTechnologies = val;
                                });
                              },
                              controller: technologiesController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.fiveProgram,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text(ConstantString.projectDescription,
                                style: custTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ConstantString.enterProjectDes;
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.projectDescription = val;
                                });
                              },
                              controller: projectDescriptionController,
                              decoration: const InputDecoration(
                                hintText: ConstantString.enterProjectDes,
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
                            if (projectFormKey.currentState!.validate()) {
                              projectFormKey.currentState!.save();

                              // setState(() => Navigator.of(context).pop());
                              Get.offAllNamed(AchievementScreen.routeName);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Text(ConstantString.save),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            projectFormKey.currentState!.reset();

                            projectTitleController.clear();
                            rolesController.clear();
                            technologiesController.clear();
                            projectDescriptionController.clear();
                            setState(() {
                              Global.projectTitle = null;
                              Global.projectRoles = null;
                              Global.projectTechnologies = null;
                              Global.projectDescription = null;
                              Global.projectCheckBoxCProgramming = false;
                              Global.projectCheckBoxCPP = false;
                              Global.projectCheckBoxFlutter = false;
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
