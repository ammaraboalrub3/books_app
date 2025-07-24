import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/core/errors/fauiler.dart';
import 'package:bookly_app/core/util/aoi_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failuer, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getBooks(
          endPoint:
              "volumes?Filtering=free-ebooks&q=sublect:programming&sorting=newest");

      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(SerrverFailuer.fromDioException(e));
      }
      return left(SerrverFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<BookModel>>> fetchFeatcherdBooks() async {
    try {
      var data = await apiService.getBooks(
          endPoint: "volumes?Filtering=free-ebooks&q=sublect:computer science");

      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(SerrverFailuer.fromDioException(e));
      }
      return left(SerrverFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, List<BookModel>>> fetchSimillerBooks(
      {required String category}) async {
    try {
      var data = await apiService.getBooks(
          endPoint:
              "volumes?Filtering=free-ebooks&q=sublect:$category&sorting=relevance");

      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(SerrverFailuer.fromDioException(e));
      }
      return left(SerrverFailuer(e.toString()));
    }
  }
}
