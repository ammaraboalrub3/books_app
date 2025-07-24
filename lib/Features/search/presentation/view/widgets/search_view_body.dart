import 'package:bookly_app/Features/search/presentation/view/widgets/search_listView_builder.dart';
import 'package:bookly_app/core/util/styles.dart';
import 'package:flutter/material.dart';

import 'custom_textfiled.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Reselt",
                  style: Styles.textStyle16,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SearchReseltListView(),
        ],
      ),
    );
  }
}
