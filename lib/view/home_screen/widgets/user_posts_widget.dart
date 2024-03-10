// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';

class UserPostsWidget extends StatefulWidget {
  const UserPostsWidget(
      {super.key,
      required this.userName,
      required this.proPic,
      required this.location,
      required this.postImagesList,
      this.isLiked = false,
      this.caption});

  final String userName;
  final String proPic;
  final String location;
  final List postImagesList;
  final bool isLiked;
  final String? caption;

  @override
  State<UserPostsWidget> createState() => _UserPostsWidgetState();
}

class _UserPostsWidgetState extends State<UserPostsWidget> {
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
              backgroundImage: NetworkImage(widget.proPic),
            ),
            title: Row(
              children: [
                Text(
                  widget.userName,
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
              widget.location,
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
                  itemCount: widget.postImagesList.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.postImagesList[index]),
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
                        "$currentPage/${widget.postImagesList.length}",
                        style: TextStyle(color: ColorConstants.primaryWhite),
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        widget.isLiked
                            ? Icon(
                                Icons.favorite_rounded,
                                size: 25,
                                color: ColorConstants.normalRed,
                              )
                            : Icon(Icons.favorite_border_outlined, size: 25),
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
                          widget.postImagesList.length,
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
                SizedBox(height: 13.5),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(widget.proPic),
                    ),
                    SizedBox(width: 16),
                    RichText(
                        text: TextSpan(
                            text: "Liked by ",
                            style:
                                TextStyle(color: ColorConstants.primaryBlack),
                            children: [
                          TextSpan(
                              text: "craig_love ",
                              style: TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: "and "),
                          TextSpan(
                              text: "1267 others",
                              style: TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontWeight: FontWeight.bold))
                        ]))
                  ],
                ),
                SizedBox(height: 13.5),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: widget.userName,
                        style: TextStyle(
                            color: ColorConstants.primaryBlack,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: " ${widget.caption}",
                              style: TextStyle(
                                  color: ColorConstants.primaryBlack,
                                  fontWeight: FontWeight.normal))
                        ])),
                SizedBox(height: 13.5),
                Text(
                  "September 19",
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorConstants.primaryBlack.withOpacity(.5),
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
