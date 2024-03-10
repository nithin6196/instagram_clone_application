// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Center(
                  child: Text(
                "Cancel",
                style: TextStyle(
                    color: ColorConstants.primaryBlack,
                    fontWeight: FontWeight.w500),
              ))),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Recents",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          actions: [
            Text(
              "Next",
              style: TextStyle(color: ColorConstants.primaryBlue),
            ),
            SizedBox(width: 8)
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.4,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=600"),
                ),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryBlack.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.all_inclusive_rounded,
                    color: ColorConstants.primaryWhite,
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryBlack.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.space_dashboard,
                    color: ColorConstants.primaryWhite,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstants.primaryBlack.withOpacity(0.5)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_none_sharp,
                        color: ColorConstants.primaryWhite,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "SELECT MULTIPLE",
                        style: TextStyle(color: ColorConstants.primaryWhite),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
        bottomNavigationBar: TabBar(
            labelColor: ColorConstants.primaryBlack,
            unselectedLabelColor: ColorConstants.primaryBlack.withOpacity(0.4),
            indicator: BoxDecoration(),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: "Library"),
              Tab(text: "Photo"),
              Tab(text: "Video"),
            ]),
      ),
    );
  }
}
