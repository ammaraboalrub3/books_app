import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookImageListView extends StatefulWidget {
  const CustomBookImageListView({
    super.key,
    required this.book,
    this.onReach70Percent,
    this.resetTriggerWhenScrollsBack = false,
  });

  final List<BookEntity> book;
  final VoidCallback? onReach70Percent;
  final bool resetTriggerWhenScrollsBack;

  @override
  State<CustomBookImageListView> createState() =>
      _CustomBookImageListViewState();
}

class _CustomBookImageListViewState extends State<CustomBookImageListView> {
  final ScrollController _controller = ScrollController();
  bool _fired = false;
  var nextPage = 1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() async {
    if (!_controller.hasClients) return;

    final max = _controller.position.maxScrollExtent;
    if (max > 0) {
      final ratio = _controller.position.pixels / max;
      if (!_fired && ratio >= 0.7) {
        _fired = true;
        widget.onReach70Percent?.call();
        await BlocProvider.of<FeaturedBooksCubit>(
          context,
        ).fetchFeaturedBooks(pageNumber: nextPage);
      }
      nextPage += 1;
      _fired = false;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: ListView.builder(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.book.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BookDetailesView.routeName,
                    arguments: widget.book[index],
                  );
                },
                child: CustomBookImage(image: widget.book[index].image ?? ""),
              ),
            );
          },
        ),
      ),
    );
  }
}
