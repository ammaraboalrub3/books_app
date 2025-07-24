import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimillerBooks({required String catigory}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimillerBooks(category: catigory);
    result.fold((faluir) {
      emit(SimilerBooksFauiler(faluir.errorMessage));
    }, (books) {
      emit(SimilerBooksSucess(books));
    });
  }
}
