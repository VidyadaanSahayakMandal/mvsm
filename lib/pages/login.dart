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
import 'package:svsm/widgets/common.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String step = "INIT";
  String label = "Email ID";
  String email = "";
  String otp = "";

  void setStep(String newStep) {
    setState(() {
      step = newStep;
    });
  }

  Widget getEmailId() {
    return Column(
      children: [
        const Text("Welcome.", style: Common.textStyleHeader1),
        const Text(
          "If you are a registered VSM Student, please enter your Email ID to continue. "
          "If you are not a VSM student, you can apply by providing the required details.",
          style: Common.textStyleParagraph,
        ),
        TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Email ID",
          ),
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            Cloud.post(
                service: Cloud.SERVICE_USER,
                action: Cloud.ACTION_SEND_OTP,
                data: {"email": email}).then((value) {
              print(value);
            }).catchError((error) {
              print(error);
            });
            setState(() {
              step = STEP_GET_OTP;
            });
          },
          style: Common.elevatedButtonStyle,
          child: const Text("Get OTP"),
        )
      ],
    );
  }

  Widget getOtp() {
    return Column(
      children: [
        const Text("Welcome.", style: Common.textStyleHeader1),
        const Text(
          "Please check your mailbox for an email from ${Cloud.otpMailId}. "
          "If you are a new to VSM, you can apply by providing the required details.",
          style: Common.textStyleParagraph,
        ),
        TextField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "OTP",
          ),
          onChanged: (value) {
            setState(() {
              otp = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              step = STEP_GET_OTP;
            });
          },
          style: Common.elevatedButtonStyle,
          child: const Text("Get OTP"),
        )
      ],
    );
  }

  Widget showStepWidget() {
    if (step == STEP_INIT) {
      return getEmailId();
    }
    if (step == STEP_GET_OTP) {
      return getEmailId();
    }
    if (step == STEP_NEW_STUDENT_OTP) {
      return getEmailId();
    }
    if (step == STEP_NEW_STUDENT_FORM) {
      return getEmailId();
    }
    if (step == STEP_NEW_STUDENT_CONFIRMATION) {
      return getEmailId();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/logo.png"),
          ),
          showStepWidget(),
        ],
      ),
    );
  }

  static const STEP_INIT = "INIT";
  static const STEP_GET_OTP = "GET_OTP";
  static const STEP_NEW_STUDENT_OTP = "NEW_STUDENT_OTP";
  static const STEP_NEW_STUDENT_FORM = "NEW_STUDENT_FORM";
  static const STEP_NEW_STUDENT_CONFIRMATION = "NEW_STUDENT_CONFIRMATION";
}
