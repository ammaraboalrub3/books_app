import 'package:bookly/core/util/app_styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_sharp, color: Colors.yellow),
        Text(bookEntity.rating.toString(), style: AppStyles.medium16),
        SizedBox(width: 9),
        Opacity(
          opacity: 0.5,
          child: Text("(2390)", style: AppStyles.regular14),
        ),
      ],
    );
  }
}
