// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/view/notification_screen/widget/tabs/your_notifications_tab.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: TabBar(
                indicatorWeight: 1,
                dividerHeight: 0,
                unselectedLabelColor:
                    ColorConstants.primaryBlack.withOpacity(.2),
                labelColor: ColorConstants.primaryBlack,
                indicatorColor: ColorConstants.primaryBlack,
                tabs: [
                  Tab(text: "Following"),
                  Tab(text: "You"),
                ],
              )),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.amber,
          ),
          YourNotificationsTab()
        ]),
      ),
    );
  }
}
