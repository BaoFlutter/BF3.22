import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../view_models/firebase_auth_controller.dart';
import '../../constants.dart';
import '../../utils/utils.dart';
import 'auth_button.dart';
import 'auth_text_input.dart';

class BodySignUp extends StatefulWidget {
  BodySignUp({
    Key? key,
    required this.formKey,
    required this.nameEditingController,
    required this.emailEditingController,
    required this.passwordEditingController,
    required this.confirmPasswordEditingController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final TextEditingController confirmPasswordEditingController;

  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  File? avatarImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              Utils.showPickImageModelBottomSheet(context,
                  onPickImage: (image) {
                setState(() {
                  avatarImage = image;
                });
                Navigator.pop(context);
              });
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  image: avatarImage != null
                      ? DecorationImage(
                          image: FileImage(avatarImage!), fit: BoxFit.cover)
                      : null),
              child: avatarImage != null
                  ? null
                  : SvgPicture.asset(
                      imageIcon,
                      width: 52,
                      height: 52,
                    ),
            ),
          ),
          SizedBox(height: 30),
          AuthTextInput(
            controller: widget.nameEditingController,
            lableText: "Name",
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
          ),
          SizedBox(height: 30),
          AuthTextInput(
            controller: widget.emailEditingController,
            lableText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30),
          AuthTextInput(
            controller: widget.passwordEditingController,
            lableText: "Password",
            keyboardType: TextInputType.text,
            obscure: true,
          ),
          SizedBox(height: 30),
          AuthTextInput(
            controller: widget.confirmPasswordEditingController,
            lableText: "Confirm Password",
            keyboardType: TextInputType.text,
            obscure: true,
            validator: (val) {
              if (val!.isEmpty) {
                return "Can not be empty!";
              }
              if (widget.passwordEditingController.text !=
                  widget.confirmPasswordEditingController.text) {
                return "Password does not match!";
              }
            },
          ),
          SizedBox(height: 30),
          AuthButton(
              onTap: () async {
                if (widget.formKey.currentState!.validate()) {
                  await context
                      .read<FirebaseAuthController>()
                      .createAccount(
                          name: widget.nameEditingController.text.trim(),
                          email: widget.emailEditingController.text.trim(),
                          password:
                              widget.passwordEditingController.text.trim(),
                          file: avatarImage)
                      .then((value) {
                    if (value) {
                      Navigator.pop(context);
                    }
                  });
                }
              },
              title: "Sign Up"),
        ],
      ),
    );
  }
}
