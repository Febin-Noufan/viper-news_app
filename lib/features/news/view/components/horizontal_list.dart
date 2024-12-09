import 'package:flutter/material.dart';

import 'package:viper_design/features/news/view/components/card/horiz_card.dart';

class HorizontalList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final articles;
  const HorizontalList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return HorizListCardWidget(article: article,);
        },
      ),
    );
  }
}
