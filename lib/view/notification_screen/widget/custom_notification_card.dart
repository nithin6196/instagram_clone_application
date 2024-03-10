// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/global_widgets/custom_button.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard(
      {super.key,
      required this.isFollow,
      required this.isAlreadyFollowing,
      required this.profileImages});
  final List profileImages;
  final bool isFollow;
  final bool isAlreadyFollowing;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          profileImages.length < 2
              ? CircleAvatar(radius: 22)
              : Stack(
                  children: [
                    SizedBox(
                      height: 44,
                      width: 44,
                    ),
                    CircleAvatar(
                      radius: 16,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: ColorConstants.primaryWhite,
                          child: CircleAvatar(
                            radius: 16,
                          ),
                        ))
                  ],
                ),
          SizedBox(width: 12),
          Expanded(
              child: Text(
            "karenne liked your photo. 1h",
            maxLines: 3,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(width: 20),
          isFollow
              ? SizedBox(
                  width: 90,
                  child: CustomButton(
                    verticalPadding: 5,
                    horizontalPadding: 5,
                    text: isAlreadyFollowing ? "Message" : "Follow",
                    buttonColor: isAlreadyFollowing
                        ? Colors.transparent
                        : ColorConstants.primaryBlue,
                    textColor: isAlreadyFollowing
                        ? ColorConstants.primaryBlack
                        : ColorConstants.primaryWhite,
                    haveBorder: isAlreadyFollowing,
                  ),
                )
              : Container(
                  height: 44,
                  width: 44,
                  color: Colors.red,
                )
        ],
      ),
    );
  }
}
