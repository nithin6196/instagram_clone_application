// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_ui/core/constants/color_constants.dart';
import 'package:instagram_ui/view/search_screen/widget/custom_search_result_grid.dart';
import 'package:instagram_ui/view/search_screen/widget/search_category_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIconConstraints: BoxConstraints(minWidth: 30),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                        ),
                        isDense: true,
                        fillColor: ColorConstants.primaryBlack.withOpacity(.1),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  )),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.select_all_sharp))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorConstants.primaryBlack.withOpacity(.1)))),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SearchCategoryCard(
                                icon: index.isEven
                                    ? Icons.favorite_border_outlined
                                    : null),
                          )),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: List.generate(
                  4,
                  (index) => CustomSearchResultGrid(
                        isIndexEven: index.isEven,
                      )),
            )))
          ],
        ),
      ),
    );
  }
}
