class Pageable<T> {
  List<T> items;
  int page;
  int totalPages;

  Pageable({required this.items, required this.page, required this.totalPages});

  bool get hasNextPage => page < totalPages - 1;
}
