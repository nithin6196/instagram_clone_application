// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchCategoryCard extends StatelessWidget {
  const SearchCategoryCard({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1),
      ),
      child: Row(
        children: [
          icon != null
              ? Icon(icon)
              : SizedBox(
                  width: 6,
                ),
          Text("Home")
        ],
      ),
    );
  }
}
