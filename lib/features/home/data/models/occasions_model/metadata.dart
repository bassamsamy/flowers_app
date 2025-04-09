class Metadata {
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;

  Metadata({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json['currentPage'] as int?,
        limit: json['limit'] as int?,
        totalPages: json['totalPages'] as int?,
        totalItems: json['totalItems'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'limit': limit,
        'totalPages': totalPages,
        'totalItems': totalItems,
      };
}
