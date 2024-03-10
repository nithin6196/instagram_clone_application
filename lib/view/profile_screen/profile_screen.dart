// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/global_widgets/custom_button.dart';
import 'package:instagram_ui/view/profile_screen/widget/profile_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock),
            Text(
              "Nithin_N",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 25,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryBlack),
                            borderRadius:
                                BorderRadius.all(Radius.circular(60))),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/447329/pexels-photo-447329.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                      ),
                      ProfileDataWidget(value: "8", text: "Posts"),
                      ProfileDataWidget(value: "752", text: "Followers"),
                      ProfileDataWidget(value: "162", text: "Following"),
                      SizedBox(width: 10)
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Nithin N",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "I am a mobile app developer based in Flutter\nMatrix Revolution"),
                  SizedBox(height: 15),
                  CustomButton(
                    text: "Edit Profile",
                    haveBorder: true,
                    buttonColor: Colors.transparent,
                    textColor: ColorConstants.primaryBlack,
                    verticalPadding: 5,
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor:
                                  ColorConstants.primaryBlack.withOpacity(.1),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorConstants.primaryWhite,
                                child: Icon(Icons.add),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Add",
                              style: TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: List.generate(
                              10,
                              (index) => Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [],
                                    ),
                                  )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
