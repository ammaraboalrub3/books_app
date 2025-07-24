part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSucess extends NewestBooksState {
  final List<BookModel> books;

  const NewestBooksSucess(this.books);
}

class NewestBooksFailuer extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailuer(this.errMessage);
}
