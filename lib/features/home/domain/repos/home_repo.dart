import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeatueredBooks({
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewesBooks();
}
