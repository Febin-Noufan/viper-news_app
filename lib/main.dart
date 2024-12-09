import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viper_design/features/news/view/news_page.dart';
import 'package:viper_design/features/news/interactor/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tesla News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsPage(),
    );
  }
}
