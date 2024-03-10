// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/view/create_post_screen/create_post_screen.dart';
import 'package:instagram_ui/view/home_screen/home_screen.dart';
import 'package:instagram_ui/view/notification_screen/notification_screen.dart';
import 'package:instagram_ui/view/profile_screen/profile_screen.dart';
import 'package:instagram_ui/view/search_screen/search_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screenList = [
    HomeScreen(),
    SearchScreen(),
    Container(
      color: Colors.white,
    ),
    NotificationScreen(),
    ProfileScreen()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConstants.primaryBlack,
          onTap: (value) {
            if (value != 2) {
              selectedIndex = value;
              setState(() {});
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePostScreen(),
                  ));
            }
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),

            // center bottom nav button
            BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                  child: Icon(Icons.add),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedIndex != 4
                              ? ColorConstants.primaryBlack
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(20)),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/91224/pexels-photo-91224.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    radius: 15,
                  ),
                ),
                label: "")
          ]),
    );
  }
}
