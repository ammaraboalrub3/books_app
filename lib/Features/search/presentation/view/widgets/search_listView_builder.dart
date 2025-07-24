import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/view/widget/best_seller_list_view_item.dart';

class SearchReseltListView extends StatelessWidget {
  const SearchReseltListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 15),
      sliver: SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: 100, (context, index) {
        // return const BookListViewItem();
        return const Text("data");
      })),
    );
  }
}
