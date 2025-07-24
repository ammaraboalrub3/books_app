import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widget/home_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailesView extends StatefulWidget {
  const HomeDetailesView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<HomeDetailesView> createState() => _HomeDetailesViewState();
}

class _HomeDetailesViewState extends State<HomeDetailesView> {
  @override
  void initState() {
    BlocProvider.of<SimilerBooksCubit>(context).fetchSimillerBooks(
        catigory: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: HomeDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
