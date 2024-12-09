import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viper_design/features/news/interactor/news_interactor.dart';
import 'package:viper_design/features/news/interactor/provider.dart';

class NewsPresenter extends NewsService {
  Future<void> fetchNews(BuildContext context) async {
    final provider = Provider.of<NewsProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      final articlesAll = await fetchNewsAll();
      final articleTech = await fetchNewsTech();
      // await _newsService.fetchNewsAll();
      provider.setArticles(articlesAll);
      provider.setTechArticles(articleTech);
    } catch (e) {
      provider.setErrorMessage(e.toString());
    } finally {
      provider.setLoading(false);
    }
  }
}
