/*
 * Filename: c:\dev\wip\vsm\svsm\lib\pages\login.dart
 * Path: c:\dev\wip\vsm\svsm\lib\pages
 * Filename: c:\dev\wip\vsm\svsm\lib\pages\login.dart
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

// ignore_for_file: constant_identifier_names

/*
 * Filename: c:\dev\wip\vsm\svsm\lib\pages\login.dart
 * Path: c:\dev\wip\vsm\svsm\lib\pages
 * Created Date: Monday, November 21st 2022, 5:35:52 pm
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */

import 'package:flutter/material.dart';
import 'package:svsm/data/cloud.dart';
import 'package:svsm/data/secret.dart';
import 'package:svsm/widgets/common.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String step = STEP_INIT;
  String label = "Email ID";
  String email = "";
  String otp = "";
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SecretManager.init().then((value) {
      var token = SecretManager.getSecret(key: "token");
      if (token != null) {
        Cloud.setToken(token);
        Cloud.websocketInit();
        Cloud.webSocketSubscribe();
        Navigator.pushReplacementNamed(context, "/dashboard");
      }
    });
  }

  final stepText = {
    STEP_INIT: "If you are a registered VSM Student, please enter your Email ID to "
        "continue. If you are not a VSM student, you can apply by providing the required details.",
    STEP_GET_OTP: "Please check your mailbox for an email from ${Cloud.otpMailId}. "
        "If you are a new to VSM, you can apply by providing the required details.",
  };

  final stepTextFieldLabel = {
    STEP_INIT: "EmailID",
    STEP_GET_OTP: "OTP",
  };

  final stepButtonText = {
    STEP_INIT: "Get OTP",
    STEP_GET_OTP: "Submit",
  };

  void initOtpButtonClick() {
    email = textFieldController.text;

    Cloud.post(
      service: Cloud.SERVICE_USER,
      action: Cloud.ACTION_SEND_OTP,
      data: {"email": email},
    ).then((response) {
      if (response["success"]) {
        textFieldController.clear();
        if (!response["value"].containsKey("subscription")) {
          setState(() {
            step = STEP_NEW_STUDENT_OTP;
          });
          return;
        }
        var subscription = response["value"]["subscription"];
        if (subscription["plan"] == "student" &&
            subscription["endDate"] > DateTime.now().millisecondsSinceEpoch) {
          setState(() {
            step = STEP_GET_OTP;
          });
        }
      }
    }).catchError((error) {
      print(error);
    });
  }

  void getOtpButtonClick() {
    otp = textFieldController.text;
    Cloud.post(
      service: Cloud.SERVICE_USER,
      action: Cloud.ACTION_CHECK_OTP,
      data: {"email": email, "otp": otp},
    ).then((response) {
      if (response["success"]) {
        Cloud.setToken(response["value"]);
        SecretManager.addSecret(key: "token", value: response["value"]);
        Navigator.pushReplacementNamed(context, "/dashboard");
      } else {
        print("OTP Mismatch");
      }
    });
  }

  void buttonClick() {
    if (step == STEP_INIT) {
      initOtpButtonClick();
    } else if (step == STEP_GET_OTP) {
      getOtpButtonClick();
    }
  }

  void setStep(String newStep) {
    setState(() {
      step = newStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Stack(children: [
          const Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/logo.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 1,),
              Card(
                elevation: 40,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Welcome", style: Common.textStyleHeader1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          stepText[step]!,
                          style: Common.textStyleParagraph,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: stepTextFieldLabel[step],
                          ),
                          controller: textFieldController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ElevatedButton(
                          onPressed: buttonClick,
                          style: Common.elevatedButtonStyle,
                          child: Text(stepButtonText[step]!),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  static const STEP_INIT = "INIT";
  static const STEP_GET_OTP = "GET_OTP";
  static const STEP_NEW_STUDENT_OTP = "NEW_STUDENT_OTP";
  static const STEP_NEW_STUDENT_FORM = "NEW_STUDENT_FORM";
  static const STEP_NEW_STUDENT_CONFIRMATION = "NEW_STUDENT_CONFIRMATION";
}
