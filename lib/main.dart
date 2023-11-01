import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/constant/img_name.dart';
import 'package:test_1/screens/build_options_screen.dart';
import 'package:test_1/screens/home_screen.dart';
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

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: BuildOptionsScreen.routeName,
            page: () => const BuildOptionsScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: AchievementScreen.routeName,
            page: () => const AchievementScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: CarrierObjectiveScreen.routeName,
            page: () => const CarrierObjectiveScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: ContactInfoScreen.routeName,
            page: () => const ContactInfoScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: DeclarationScreen.routeName,
            page: () => const DeclarationScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: EducationScreen.routeName,
            page: () => const EducationScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: ExperienceScreen.routeName,
            page: () => const ExperienceScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: InterestHobbiesScreen.routeName,
            page: () => const InterestHobbiesScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: PersonalDetailsScreen.routeName,
            page: () => const PersonalDetailsScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: ProjectsScreen.routeName,
            page: () => const ProjectsScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: ReferenceScreen.routeName,
            page: () => const ReferenceScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: TechnicalSkillsScreen.routeName,
            page: () => const TechnicalSkillsScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: PDFScreen.routeName,
            page: () => const PDFScreen(),
            transition: Transition.noTransition),
      ],
      home: const HomePage(),
    ),
  );
}
