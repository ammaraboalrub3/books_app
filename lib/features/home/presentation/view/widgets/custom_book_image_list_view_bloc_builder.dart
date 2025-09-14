import 'package:bookly/core/helper/dummy_books.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBookImageListViewBlocBuilder extends StatelessWidget {
  const CustomBookImageListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return CustomBookImageListView(book: state.books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMess);
        } else {
          return Skeletonizer(
            enabled: true,
            child: CustomBookImageListView(book: getDummyEntity()),
          );
        }
      },
    );
  }
}
