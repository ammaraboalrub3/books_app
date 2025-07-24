part of 'featcherd_books_cubit.dart';

abstract class FeatcherdBooksState extends Equatable {
  const FeatcherdBooksState();

  @override
  List<Object> get props => [];
}

class FeatcherdCubitInitial extends FeatcherdBooksState {}

class FeatcherdCubitLoading extends FeatcherdBooksState {}

class FeatcherdCubitSucess extends FeatcherdBooksState {
  final List<BookModel> books;

  const FeatcherdCubitSucess(this.books);
}

class FeatcherdCubitFailuer extends FeatcherdBooksState {
  final String errMessage;

  const FeatcherdCubitFailuer(this.errMessage);
}
