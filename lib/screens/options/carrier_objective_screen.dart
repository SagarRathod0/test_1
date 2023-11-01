import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/screens/options/personal_details_screen.dart';
import 'package:test_1/widget/backButton.dart';

import '../../globals.dart';

class CarrierObjectiveScreen extends StatefulWidget {
  const CarrierObjectiveScreen({Key? key}) : super(key: key);
  static String routeName = "/CarrierObjectiveScreen";

  @override
  State<CarrierObjectiveScreen> createState() => _CarrierObjectiveScreenState();
}

class _CarrierObjectiveScreenState extends State<CarrierObjectiveScreen> {
  //------------------------------------------------------------------ Variables -----------------------------------------------------------------//
  final GlobalKey<FormState> careerObjectiveFormKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController experiencedController = TextEditingController();

//--------------------------------------------------------------------- UI ---------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appBar(),
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
            child: _inputBox(height, width),
          ),
        ],
      ),
    );
  }
  //--------------------------------------------------------------- Helper Widgets ---------------------------------------------------------------//

  Widget _inputBox(double height, double width) {
    return Container(
      color: const Color(0xffEDEDED),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: careerObjectiveFormKey,
              child: Column(
                children: [
                  // Career Objective
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    height: height * 0.35,
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            ConstantString.carrierObjective,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ConstantColor.ff0475FF.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return ConstantString.enterDescription;
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.careerObjectiveDescription = val;
                              });
                            },
                            maxLines: 10,
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              hintText: ConstantString.description,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Current Designation (Experience Candidate)
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    height: height * 0.2,
                    width: width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            ConstantString.currentDesignation,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ConstantColor.ff0475FF.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return ConstantString.enterDesignation;
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.careerObjectiveExperienced = val;
                              });
                            },
                            controller: experiencedController,
                            decoration: const InputDecoration(
                              hintText: ConstantString.softwareEngineer,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (careerObjectiveFormKey.currentState!.validate()) {
                      careerObjectiveFormKey.currentState!.save();
                      // Navigator.of(context).pop();
                      Get.offAllNamed(PersonalDetailsScreen.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantColor.ff0475FF,
                  ),
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    careerObjectiveFormKey.currentState!.reset();

                    descriptionController.clear();
                    experiencedController.clear();
                    setState(() {
                      Global.careerObjectiveDescription = null;
                      Global.careerObjectiveExperienced = null;
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
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: const BackBotton(),
      backgroundColor: ConstantColor.ff0475FF,
      title: const Text(ConstantString.carrierObjective),
      centerTitle: true,
      elevation: 0,
    );
  }
}
