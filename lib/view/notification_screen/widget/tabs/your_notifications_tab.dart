// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/view/notification_screen/widget/custom_card_builder_tile.dart';

class YourNotificationsTab extends StatefulWidget {
  const YourNotificationsTab({super.key});

  @override
  State<YourNotificationsTab> createState() => _YourNotificationsTabState();
}

class _YourNotificationsTabState extends State<YourNotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorConstants.primaryBlack.withOpacity(.1)))),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            child: Text("Follow Requests"),
          ),
          Column(
            children: List.generate(
                10,
                (index) => CustomCardBuilderTile(
                      itemCount: index + 1,
                    )),
          )
        ],
      ),
    );
  }
}
