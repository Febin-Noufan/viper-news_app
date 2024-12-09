import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:viper_design/features/news/entity/news_entity.dart';
import 'package:viper_design/features/news/entity/news_tech_entity.dart';

class NewsService {
  Future<List<NewsArticle>> fetchNewsAll() async {
    final url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-11-09&sortBy=publishedAt&apiKey=155be81e67e342deb704734b631d50ad";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsArticle.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load new................s');
    }
  }

  Future<List<NewsTechArticle>> fetchNewsTech() async {
    final url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=155be81e67e342deb704734b631d50ad';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['articles'] as List)
          .map((article) => NewsTechArticle.fromJson(article))
          .toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
