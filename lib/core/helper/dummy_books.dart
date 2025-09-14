import 'package:bookly/features/home/domain/entities/book_entity.dart';

BookEntity getDummyBooks() {
  return BookEntity(
    image: null,
    authorName: "authorName",
    title: "title",
    bookiId: "bookiId",
    price: 0.0,
    rating: 4.4,
  );
}

List<BookEntity> getDummyEntity() {
  return [getDummyBooks(), getDummyBooks(), getDummyBooks(), getDummyBooks()];
}
