import 'package:bloc/bloc.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeatueredBooks();
    result.fold(
      (f) {
        emit(FeaturedBooksFailure(errorMess: f.errorMess));
      },
      (r) {
        emit(FeaturedBooksSuccess(books: r));
      },
    );
  }
}
