import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/constant/img_name.dart';
import 'package:test_1/screens/options/achievement_screen.dart';
import 'package:test_1/screens/options/carrier_objective_screen.dart';
import 'package:test_1/screens/options/contact_info_screen.dart';
import 'package:test_1/screens/options/declaration_screen.dart';
import 'package:test_1/screens/options/education_screen.dart';
import 'package:test_1/screens/options/experience_screen.dart';
import 'package:test_1/screens/options/interest_hobbies_screen.dart';
import 'package:test_1/screens/options/personal_details_screen.dart';
import 'package:test_1/screens/options/projects_screen.dart';
import 'package:test_1/screens/options/reference_screen.dart';
import 'package:test_1/screens/options/technical_skills_screen.dart';
import 'package:test_1/screens/pdf_screen.dart';
import 'package:test_1/widget/backButton.dart';

import '../globals.dart';

class BuildOptionsScreen extends StatefulWidget {
  const BuildOptionsScreen({Key? key}) : super(key: key);
  static String routeName = "/BuildOptionsScreen";

  @override
  State<BuildOptionsScreen> createState() => _BuildOptionsScreenState();
}

class _BuildOptionsScreenState extends State<BuildOptionsScreen> {
  List<Map> options = [
    {
      "id": 1,
      "option_name": "Contact info",
      "image": ImgName.contactDetail,
      "routes": ContactInfoScreen.routeName,
    },
    {
      "id": 2,
      "option_name": "Carrier Objective",
      "image": ImgName.bag,
      "routes": CarrierObjectiveScreen.routeName,
    },
    {
      "id": 3,
      "option_name": "Personal Details",
      "image": ImgName.account,
      "routes": PersonalDetailsScreen.routeName,
    },
    {
      "id": 4,
      "option_name": "Educations",
      "image": ImgName.cap,
      "routes": EducationScreen.routeName,
    },
    {
      "id": 5,
      "option_name": "Experience",
      "image": ImgName.thinking,
      "routes": ExperienceScreen.routeName,
    },
    {
      "id": 6,
      "option_name": "Technical Skills",
      "image": ImgName.crtificate,
      "routes": TechnicalSkillsScreen.routeName,
    },
    {
      "id": 7,
      "option_name": "Interest/Hobbies",
      "image": ImgName.book,
      "routes": InterestHobbiesScreen.routeName,
    },
    {
      "id": 8,
      "option_name": "Projects",
      "image": ImgName.project,
      "routes": ProjectsScreen.routeName,
    },
    {
      "id": 9,
      "option_name": "Achievements",
      "image": ImgName.experience,
      "routes": AchievementScreen.routeName,
    },
    {
      "id": 10,
      "option_name": "References",
      "image": ImgName.handshake,
      "routes": ReferenceScreen.routeName,
    },
    {
      "id": 11,
      "option_name": "Declarations",
      "image": ImgName.declaration,
      "routes": DeclarationScreen.routeName,
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text("Resume Workspace"),
        centerTitle: true,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              if (Global.image != null) {
                Get.toNamed(PDFScreen.routeName);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Select image First...")));
                Navigator.of(context).pushNamed("contact_info_page");
              }
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.picture_as_pdf),
            ),
          )
        ],
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
                "Build Options",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ...options.map((option) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(option["routes"]);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: width * 0.04),
                              Image.asset(
                                option["image"],
                                height: height * 0.0495,
                              ),
                              SizedBox(width: width * 0.06),
                              Text(
                                option["option_name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_sharp),
                              SizedBox(width: width * 0.05),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
