part of 'similer_books_cubit.dart';

abstract class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

class SimilerBooksInitial extends SimilerBooksState {}

class SimilerBooksSucess extends SimilerBooksState {
  final List<BookModel> books;

  const SimilerBooksSucess(this.books);
}

class SimilerBooksFauiler extends SimilerBooksState {
  final String errMessage;

  const SimilerBooksFauiler(this.errMessage);
}

class SimilerBooksLoading extends SimilerBooksState {}
