class NewsArticle {
  final String title;
  final String description;
  final String content;
  final String urlToImage;
  final String source;

  NewsArticle({
    required this.title,
    required this.description,
    required this.content,
    required this.urlToImage,
    required this.source,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      content: json['content'] ?? 'No Content',
      urlToImage: json['urlToImage'] ?? '',
      source: json['source']['name'] ?? 'Unknown',
    );
  }
}
