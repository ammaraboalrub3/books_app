import 'package:bookly/constants.dart';
import 'package:bookly/core/util/app_styles.dart';
import 'package:bookly/core/widgets/custom_review.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorezinatalPadding),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(image: bookEntity.image ?? ""),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookEntity.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,

                    style: AppStyles.regular20.copyWith(
                      fontFamily: "GTSectraFine",
                    ),
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      bookEntity.authorName!,
                      style: AppStyles.medium14,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        bookEntity.price.toString(),
                        style: AppStyles.bold20,
                      ),
                      Spacer(),
                      CustomReview(bookEntity: bookEntity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
