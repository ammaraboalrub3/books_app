part of 'newest_book_cubit.dart';

@immutable
abstract class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books;

  NewestBookSuccess({required this.books});
}

final class NewestBookFailure extends NewestBookState {
  final String errorMess;

  NewestBookFailure({required this.errorMess});
}
