import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());

    var result = await homeRepo.fetchNewesBooks();
    result.fold(
      (f) {
        emit(NewestBookFailure(errorMess: f.errorMess));
      },
      (r) {
        emit(NewestBookSuccess(books: r));
      },
    );
  }
}
