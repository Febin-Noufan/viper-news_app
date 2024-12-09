import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viper_design/features/news/presenter/news_presenter.dart';

import 'package:viper_design/features/news/interactor/provider.dart';

import 'package:viper_design/features/news/view/components/carousal.dart';
import 'package:viper_design/features/news/view/components/horizontal_list.dart';
import 'package:viper_design/features/news/view/components/list_view.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the automatic scrolling timer
    _startAutoScroll();
  }

  @override
  void dispose() {
    // Dispose the timer when the page is disposed
    _timer?.cancel();
    super.dispose();
  }

  // Start the auto-scroll timer
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage >= 10) {
          nextPage = 0; // Loop back to the first page if necessary
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final NewsPresenter presenter = NewsPresenter();
    presenter.fetchNews(context);

    return Scaffold(
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          // Show loading indicator if data is being fetched
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message if an error occurred
          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }

          // Display content if articles are available
          return provider.articles.isEmpty
              ? const Center(child: Text('No news available.'))
              : ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    CarousalWidget(
                      controller: _pageController,
                      articles: provider.articles,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "TechCrunch right now",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    HorizontalList(
                      articles: provider.techarticles,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      " US right now",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    // const SizedBox(height: 20),
                    HorizontalList(
                      articles: provider.articles,
                    ),
                    Text(
                      " US right now",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    NewsListView(
                      articles: provider.articles,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
