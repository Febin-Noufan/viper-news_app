import 'package:flutter/material.dart';
import 'package:viper_design/features/news/entity/news_entity.dart';
import 'package:viper_design/features/news/view/news_details.dart';

class NewsRouter {
  static void navigateToNewsDetailPage(
      BuildContext context, NewsArticle article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailPage(article: article),
      ),
    );
  }
}
