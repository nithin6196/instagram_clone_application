// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({super.key, required this.value, required this.text});
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
