import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/core/errors/fauiler.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failuer, List<BookModel>>> fetchFeatcherdBooks();
  Future<Either<Failuer, List<BookModel>>> fetchSimillerBooks(
      {required String category});
}
