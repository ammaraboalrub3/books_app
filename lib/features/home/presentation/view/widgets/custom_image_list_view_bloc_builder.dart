import 'package:bookly/core/helper/dummy_books.dart';
import 'package:bookly/features/home/presentation/manger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_image_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageItemListViewBlocBuilder extends StatelessWidget {
  const CustomImageItemListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return CustomImageItemListView(book: state.books);
        } else if (state is NewestBookFailure) {
          return Text(state.errorMess);
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: CustomImageItemListView(book: getDummyEntity()),
          );
        }
      },
    );
  }
}
