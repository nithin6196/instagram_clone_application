// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';

class CustomStoryAvatar extends StatelessWidget {
  const CustomStoryAvatar(
      {super.key,
      required this.userName,
      required this.profilePic,
      this.isLive = false});

  final String userName;
  final String profilePic;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // #1
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                padding: EdgeInsets.all(4),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      ColorConstants.normalRed,
                      ColorConstants.normalGreen,
                      ColorConstants.normalYellow
                    ])),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: ColorConstants.textFieldFill,
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profilePic),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: isLive == true
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            color: ColorConstants.livePink,
                            border: Border.all(
                                width: 4, color: ColorConstants.primaryWhite),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "LIVE",
                            style:
                                TextStyle(color: ColorConstants.primaryWhite),
                          ),
                        )
                      : SizedBox())
            ],
          ),
          SizedBox(height: 6),
          Text(userName)
        ],
      ),
    );
  }
}
