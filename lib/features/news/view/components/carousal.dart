import 'package:flutter/material.dart';
import 'package:viper_design/features/news/entity/news_entity.dart';

class CarousalWidget extends StatelessWidget {
  final PageController controller;
  final List<NewsArticle> articles;

  const CarousalWidget({super.key, required this.controller, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6, // Adjust height dynamically
      child: PageView.builder(
        controller: controller,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  article.urlToImage.isNotEmpty
                      ? Image.network(
                          article.urlToImage,
                          fit: BoxFit.fill,
                        )
                      : const Icon(Icons.image, size: 100),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      article.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
