import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/core/util/functions/url_lancher.dart';
import 'package:flutter/material.dart';

import 'custom_part_button.dart';

class CustomButonAction extends StatelessWidget {
  const CustomButonAction({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              child: const CustomPartButton(
                  fontWeight: FontWeight.bold,
                  colorText: Colors.black,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  text: "free"),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                customLancherUri(context, bookModel.volumeInfo.previewLink!);
              },
              child: CustomPartButton(
                  fontWeight: FontWeight.normal,
                  colorText: Colors.white,
                  color: const Color(0xffEF8262),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  text: getText(bookModel)),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Availabile";
    } else {
      return "Free Preview";
    }
  }
}
