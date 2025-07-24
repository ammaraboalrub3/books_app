import 'package:bookly_app/Features/home/presentation/manger/featcherd_books_cubit/featcherd_books_cubit.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/util/app_router.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_book_image.dart';

class BooksListViewBuilder extends StatelessWidget {
  const BooksListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatcherdBooksCubit, FeatcherdBooksState>(
      builder: (context, state) {
        if (state is FeatcherdCubitSucess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 6, right: 12),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDetailsHomeView,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                          imggeUrl: state
                              .books[index].volumeInfo.imageLinks.thumbnail),
                    ),
                  );
                }),
          );
        } else if (state is FeatcherdCubitFailuer) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
