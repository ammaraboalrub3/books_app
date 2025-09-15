import 'package:bookly/core/util/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatueredBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewesBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatueredBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          "volumes?Filtering=free-ebooks&q=sublect:programming&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(data);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewesBooks() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtering=free-ebooks&q=sublect:computer science",
    );
    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
