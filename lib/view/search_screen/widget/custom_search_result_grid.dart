// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CustomSearchResultGrid extends StatelessWidget {
  CustomSearchResultGrid({super.key, required this.isIndexEven});
  final bool isIndexEven;
  final List imageList = [
    "https://images.pexels.com/photos/1547813/pexels-photo-1547813.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/7957992/pexels-photo-7957992.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1011302/pexels-photo-1011302.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2418664/pexels-photo-2418664.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/8100784/pexels-photo-8100784.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/10176997/pexels-photo-10176997.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];

  final List imageList2 = [
    "https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1918246/pexels-photo-1918246.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1008000/pexels-photo-1008000.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          isIndexEven
              ? Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).width * .33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageList2[0]))),
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).width * .33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageList2[1]))),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.sizeOf(context).width * .66,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageList2[2]))),
                        ))
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.sizeOf(context).width * .66,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imageList2[2]))),
                        )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).width * .33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageList2[1]))),
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).width * .33,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageList2[0]))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageList[index]))),
            ),
          )
        ],
      ),
    );
  }
}
