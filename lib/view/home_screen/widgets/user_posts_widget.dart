// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';

class UserPostsWidget extends StatefulWidget {
  const UserPostsWidget({super.key});

  @override
  State<UserPostsWidget> createState() => _UserPostsWidgetState();
}

class _UserPostsWidgetState extends State<UserPostsWidget> {
  List<String> postImagesList = [
    "https://images.pexels.com/photos/534164/pexels-photo-534164.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/707344/pexels-photo-707344.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1820563/pexels-photo-1820563.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/234272/pexels-photo-234272.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];

  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=600"),
            ),
            title: Row(
              children: [
                Text(
                  "joshua_l",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.verified,
                  size: 15,
                  color: ColorConstants.primaryBlue,
                )
              ],
            ),
            subtitle: Text(
              "Tokyo, Japan",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
            ),
            trailing: Icon(Icons.more_horiz),
          ),
          Stack(
            children: [
              SizedBox(
                height: 375,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentPage = value + 1;
                    setState(() {});
                  },
                  itemCount: postImagesList.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(postImagesList[index]),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorConstants.primaryBlack.withOpacity(.4)),
                      child: Text(
                        "$currentPage/${postImagesList.length}",
                        style: TextStyle(color: ColorConstants.primaryWhite),
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border_outlined, size: 25),
                    SizedBox(width: 16),
                    Icon(Icons.maps_ugc_rounded, size: 25),
                    SizedBox(width: 16),
                    Icon(Icons.send_sharp, size: 25),
                  ],
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      postImagesList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: CircleAvatar(
                              backgroundColor: (index == currentPage - 1)
                                  ? ColorConstants.primaryBlue
                                  : Colors.grey.withOpacity(.4),
                              radius: (index == currentPage - 1) ? 5 : 3,
                            ),
                          )),
                )),
                Icon(Icons.bookmark_border_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
