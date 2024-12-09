import 'package:flutter/material.dart';

class HorizListCardWidget extends StatelessWidget {
  final article;

  const HorizListCardWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  article.urlToImage.isNotEmpty
                      ? Center(
                          child: Image.network(
                            article.urlToImage,
                            width: 140,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.image, size: 60),
                  const SizedBox(height: 15),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}