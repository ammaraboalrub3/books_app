import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';

part 'featcherd_books_state.dart';

class FeatcherdBooksCubit extends Cubit<FeatcherdBooksState> {
  FeatcherdBooksCubit(this.homeRepo) : super(FeatcherdCubitInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeatcherdBooks() async {
    emit(FeatcherdCubitLoading());
    var result = await homeRepo.fetchFeatcherdBooks();
    result.fold((faluer) {
      emit(FeatcherdCubitFailuer(faluer.errorMessage));
    }, (books) {
      emit(FeatcherdCubitSucess(books));
    });
  }
}
