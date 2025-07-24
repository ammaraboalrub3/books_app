import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../constants.dart';
import '../../../../../core/util/styles.dart';
import '../../../../../core/widgets/custom_button_action.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: CustomBookImage(
              imggeUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            )),
        const SizedBox(
          height: 40,
        ),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontFamily: kPrimaryFont),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const BookRating(
          rating: 10,
          count: 10,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomButonAction(
          bookModel: bookModel,
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
