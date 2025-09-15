import 'package:bookly/constants.dart';
import 'package:bookly/core/util/app_styles.dart';
import 'package:bookly/core/widgets/custom_review.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image_list_view_bloc_builder.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_button.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_detailes_app_bar.dart';
import 'package:bookly/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomDetailesAppBar(),
          SizedBox(height: 33),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.32,
            child: CustomBookImage(image: bookEntity.image!),
          ),
          SizedBox(height: 40),
          Text(
            bookEntity.title,
            style: AppStyles.regular30,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Opacity(
            opacity: 0.7,
            child: Text(bookEntity.authorName!, style: AppStyles.medium18),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomReview(bookEntity: bookEntity)],
          ),
          SizedBox(height: 37),

          CustomButton(),
          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorezinatalPadding,
            ),
            child: Row(
              children: [
                Text(S.of(context).similler_book, style: AppStyles.semiBold14),
              ],
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
            child: CustomBookImageListViewBlocConsumer(),
          ),
        ],
      ),
    );
  }
}
