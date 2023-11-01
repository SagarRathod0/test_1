import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_1/constant/constant_string.dart';
import 'package:test_1/constant/custom_color.dart';
import 'package:test_1/constant/img_name.dart';
import 'package:test_1/screens/options/carrier_objective_screen.dart';
import 'package:test_1/widget/backButton.dart';
import '../../globals.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({Key? key}) : super(key: key);
  static String routeName = "/ContactInfoScreen";

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  //------------------------------------------------------------------ Variables -----------------------------------------------------------------//
  int initialIndex = 0;

  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

//--------------------------------------------------------------------- UI ---------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackBotton(),
        backgroundColor: ConstantColor.ff0475FF,
        title: const Text(ConstantString.resumeWorkspace),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _inputBox(),
                  _photoInputBox(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: Container(
              color: const Color(0xffEDEDED),
              child: IndexedStack(
                index: initialIndex,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.48,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.white,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Expanded(
                              flex: 7,
                              child: Form(
                                key: contactFormKey,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            ImgName.user,
                                            height: height * 0.048,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: nameController,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return ConstantString
                                                    .enterNameFirst;
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.name = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              hintText: ConstantString.name,
                                              label: Text(ConstantString.name),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            ImgName.email,
                                            height: height * 0.048,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return ConstantString
                                                    .enterEmsil;
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.email = val;
                                              });
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: const InputDecoration(
                                              hintText: ConstantString.email,
                                              label: Text(ConstantString.email),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            ImgName.phone,
                                            height: height * 0.048,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: phoneController,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return ConstantString
                                                    .enterphone;
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.phone = val;
                                              });
                                            },
                                            keyboardType: TextInputType.phone,
                                            decoration: const InputDecoration(
                                              hintText: ConstantString.phone,
                                              label: Text(ConstantString.phone),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Image.asset(
                                            ImgName.pin,
                                            height: height * 0.048,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: address1Controller,
                                            validator: (val) {
                                              if (val!.isEmpty) {
                                                return ConstantString
                                                    .enterAdress;
                                              }
                                              return null;
                                            },
                                            onSaved: (val) {
                                              setState(() {
                                                Global.address1 = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              hintText: ConstantString.address,
                                              label:
                                                  Text(ConstantString.address),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: address2Controller,
                                            onSaved: (val) {
                                              setState(() {
                                                Global.address2 = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              hintText:
                                                  ConstantString.adressLine2,
                                              label: Text(
                                                  ConstantString.adressLine2),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Container()),
                                        SizedBox(width: width * 0.02),
                                        Expanded(
                                          flex: 4,
                                          child: TextFormField(
                                            controller: address3Controller,
                                            onSaved: (val) {
                                              setState(() {
                                                Global.address3 = val;
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              hintText:
                                                  ConstantString.adressLine3,
                                              label: Text(
                                                  ConstantString.adressLine3),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (contactFormKey.currentState!.validate()) {
                                  contactFormKey.currentState!.save();
                                  Get.offAllNamed(
                                      CarrierObjectiveScreen.routeName);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ConstantColor.ff0475FF,
                              ),
                              child: const Text(ConstantString.save),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  contactFormKey.currentState!.reset();

                                  nameController.clear();
                                  emailController.clear();
                                  phoneController.clear();
                                  address1Controller.clear();
                                  address2Controller.clear();
                                  address3Controller.clear();
                                  setState(() {
                                    Global.name = null;
                                    Global.email = null;
                                    Global.phone = null;
                                    Global.address1 = null;
                                    Global.address2 = null;
                                    Global.address3 = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ConstantColor.ff0475FF,
                                ),
                                child: const Text(ConstantString.clear)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: height * 0.29,
                    width: width,
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage: (Global.image != null)
                              ? FileImage(Global.image!)
                              : null,
                          radius: 60,
                          backgroundColor: const Color(0xffC4C4C4),
                          child: (Global.image == null)
                              ? const Text(
                                  ConstantString.add,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(""),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(ConstantString.gotoPickImg),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      XFile? pickerFile =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      setState(() {
                                        Global.image = File(pickerFile!.path);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ConstantColor.ff0475FF,
                                    ),
                                    child: const Text(ConstantString.gallery),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      XFile? pickerFile =
                                          await _picker.pickImage(
                                              source: ImageSource.camera);
                                      setState(() {
                                        Global.image = File(pickerFile!.path);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ConstantColor.ff0475FF,
                                    ),
                                    child: const Text(ConstantString.camera),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: ConstantColor.ff0475FF,
                          ),
                          child: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//--------------------------------------------------------------- Helper Widgets ---------------------------------------------------------------//
  Widget _photoInputBox() {
    return Expanded(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(0.2),
        onTap: () {
          setState(() {
            initialIndex = 1;
          });
        },
        child: Ink(
          color: ConstantColor.ff0475FF,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                const Text(
                  ConstantString.photo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Container(
                  color: (initialIndex == 1)
                      ? Colors.yellow
                      : ConstantColor.ff0475FF,
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputBox() {
    return Expanded(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withOpacity(0.2),
        onTap: () {
          setState(() {
            initialIndex = 0;
          });
        },
        child: Ink(
          color: ConstantColor.ff0475FF,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                const Text(
                  ConstantString.contact,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Container(
                  color: (initialIndex == 0)
                      ? Colors.yellow
                      : ConstantColor.ff0475FF,
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
