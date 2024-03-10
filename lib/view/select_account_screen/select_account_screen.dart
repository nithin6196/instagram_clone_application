// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/core/constants/image_constants.dart';
import 'package:instagram_ui/global_widgets/custom_button.dart';
import 'package:instagram_ui/view/login_screen/login_screen.dart';

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageConstants.instagramTextLogoPng),
              SizedBox(height: 50),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=600",
                ),
                radius: 50,
              ),
              SizedBox(height: 15),
              Text(
                "Nithin N",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Log in",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              ),
              SizedBox(height: 30),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Switch accounts",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.primaryBlue),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.1),
          ),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Don't have an account? ",
              style:
                  TextStyle(color: ColorConstants.primaryBlack.withOpacity(.4)),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                      color: ColorConstants.primaryBlack,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}
