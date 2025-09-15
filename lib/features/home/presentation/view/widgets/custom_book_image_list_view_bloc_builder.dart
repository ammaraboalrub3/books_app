import 'package:bookly/core/helper/dummy_books.dart';
import 'package:bookly/core/helper/snack_bar.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomBookImageListViewBlocConsumer extends StatefulWidget {
  const CustomBookImageListViewBlocConsumer({super.key});

  @override
  State<CustomBookImageListViewBlocConsumer> createState() =>
      _CustomBookImageListViewBlocConsumerState();
}

class _CustomBookImageListViewBlocConsumerState
    extends State<CustomBookImageListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          snackBar(context, state, state.errorMess);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return CustomBookImageListView(book: books);
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
