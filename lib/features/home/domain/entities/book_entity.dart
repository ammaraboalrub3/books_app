class BookEntity {
  final String? image;

  final String? authorName;

  final String title;

  final String bookiId;

  final num price;

  final num rating;

  BookEntity({
    required this.image,
    required this.authorName,
    required this.title,
    required this.bookiId,
    required this.price,
    required this.rating,
  });
}
