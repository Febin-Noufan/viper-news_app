import 'package:flutter/material.dart';
import 'package:viper_design/features/news/entity/news_entity.dart';
import 'package:viper_design/features/news/entity/news_tech_entity.dart';


class NewsProvider with ChangeNotifier {
  List<NewsArticle> _articles = [];
  List<NewsTechArticle> _techarticle=[];
  bool _isLoading = true;
  String _errorMessage = '';

  List<NewsArticle> get articles => _articles;
  List<NewsTechArticle> get techarticles => _techarticle;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void setArticles(List<NewsArticle> articles) {
    _articles = articles;
    notifyListeners();
  }
  
  void setTechArticles(List<NewsTechArticle> articles) {
    _techarticle = articles;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setErrorMessage(String error) {
    _errorMessage = error;
    notifyListeners();
  }
}
