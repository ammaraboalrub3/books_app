import 'package:bookly_app/Features/home/presentation/view/widget/best_seller_items_builder.dart';
import 'package:bookly_app/core/util/styles.dart';
import 'package:flutter/material.dart';

import 'books_list_view_builder.dart';
import 'custom_app_bar.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              BooksListViewBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BestSellerItemsBuilder(),
      ],
    );
  }
}
