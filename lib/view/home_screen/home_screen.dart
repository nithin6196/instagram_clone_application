// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/image_constants.dart';
import 'package:instagram_ui/view/dummy_db.dart';
import 'package:instagram_ui/view/home_screen/widgets/custom_story_avatar.dart';
import 'package:instagram_ui/view/home_screen/widgets/user_posts_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.camera_alt_outlined),
          title: Image.asset(
            ImageConstants.instagramTextLogoPng,
            scale: 1.5,
          ),
          actions: [
            Image.asset(ImageConstants.igtvIcon),
            SizedBox(width: 15),
            Image.asset(ImageConstants.messengerIcon),
            SizedBox(width: 15)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // custom story section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      DummyDb.storyList.length,
                      (index) => CustomStoryAvatar(
                            userName: DummyDb.storyList[index]["userName"],
                            profilePic: DummyDb.storyList[index]["profilePic"],
                            isLive: DummyDb.storyList[index]["isLive"],
                          )),
                ),
              ),
              UserPostsWidget(),
            ],
          ),
        ));
  }
}
