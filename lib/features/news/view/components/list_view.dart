import 'package:flutter/material.dart';
import 'package:viper_design/features/news/entity/news_entity.dart';
import 'package:viper_design/features/news/router/news_router.dart';

class NewsListView extends StatelessWidget {
  final List<NewsArticle> articles;
  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: article.urlToImage.isNotEmpty
                  ? Image.network(
                      article.urlToImage,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 100),
              title: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                article.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                NewsRouter.navigateToNewsDetailPage(context, article);
              },
            ),
          );
        },
      ),
    );
  }
}