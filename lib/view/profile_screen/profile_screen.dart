// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/global_widgets/custom_button.dart';
import 'package:instagram_ui/view/dummy_db.dart';
import 'package:instagram_ui/view/profile_screen/widget/outlined_circle_avatar.dart';
import 'package:instagram_ui/view/profile_screen/widget/profile_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // profile pic and posts section
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileDataWidget(value: "8", text: "Posts"),
                            ProfileDataWidget(value: "752", text: "Followers"),
                            ProfileDataWidget(value: "162", text: "Following"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  // profile data section
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
                  // highlights section
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
                              DummyDb.highlightsList.length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        OutlinedCircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              DummyDb.highlightsList[index]),
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          DummyDb.highlightTitleList[index],
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        )
                                      ],
                                    ),
                                  )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 0),
            TabBar(
                indicatorWeight: 1,
                dividerHeight: 0,
                indicatorColor: ColorConstants.primaryBlack,
                labelColor: ColorConstants.primaryBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor:
                    ColorConstants.primaryBlack.withOpacity(.3),
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_on_sharp),
                  ),
                  Tab(
                    icon: Icon(Icons.assignment_ind_outlined),
                  ),
                ]),
            Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.green),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
