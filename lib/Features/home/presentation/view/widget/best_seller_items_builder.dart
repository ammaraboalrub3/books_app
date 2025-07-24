import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widget/best_seller_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerItemsBuilder extends StatelessWidget {
  const BestSellerItemsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSucess) {
        return SliverPadding(
          padding: const EdgeInsets.only(left: 30),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.books.length, (context, index) {
            return BookListViewItem(
              bookModel: state.books[index],
            );
          })),
        );
      } else if (state is NewestBooksFailuer) {
        return SliverToBoxAdapter(
            child: CustomError(errMessage: state.errMessage));
      } else {
        return SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const CustomLoadingIndicator()));
      }
    });
  }
}
