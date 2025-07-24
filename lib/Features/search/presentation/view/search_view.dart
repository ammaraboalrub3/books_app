import 'package:bookly_app/Features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchHomeView extends StatelessWidget {
  const SearchHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
