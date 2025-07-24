import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((faluer) {
      emit(NewestBooksFailuer(faluer.errorMessage));
    }, (books) {
      emit(NewestBooksSucess(books));
    });
  }
}
