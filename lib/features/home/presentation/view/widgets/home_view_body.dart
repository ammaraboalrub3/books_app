import 'package:bookly/core/widgets/title_header.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';

import 'package:bookly/features/home/presentation/view/widgets/custom_book_image_list_view_bloc_builder.dart';

import 'package:bookly/features/home/presentation/view/widgets/custom_image_list_view_bloc_builder.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 48),
              CustomAppBar(),
              SizedBox(height: 48),
              CustomBookImageListViewBlocConsumer(),
              SizedBox(height: 48),
              TitleHeader(title: S.of(context).best_seller_header),
              SizedBox(height: 20),
            ],
          ),
        ),
        CustomImageItemListViewBlocBuilder(),
      ],
    );
  }
}
