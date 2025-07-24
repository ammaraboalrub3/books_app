import 'package:bookly_app/Features/home/presentation/view/widget/similler_books_list_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/util/styles.dart';

class SimlerBooksSection extends StatelessWidget {
  const SimlerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilerBooksListView(),
      ],
    );
  }
}
