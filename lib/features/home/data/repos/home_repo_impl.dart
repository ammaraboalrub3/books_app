import 'package:bookly/core/errors/failuer.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatueredBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.fetchFeatueredBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMess: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewesBooks() async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.fetchNewesBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMess: e.toString()));
      }
    }
  }
}
