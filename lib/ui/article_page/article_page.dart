import 'package:flutter/material.dart';
import 'package:wiki_reader/summary.dart';
import 'package:wiki_reader/ui/article_widget/article_widget.dart';

class ArticlePage extends StatelessWidget {
  final Summary summary;
  final VoidCallback nextArticle;
  final VoidCallback saveToDB;
  const ArticlePage({
    super.key, required this.summary, required this.nextArticle, required this.saveToDB});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //ArticleWidget(summary: summary),
          ElevatedButton(onPressed: nextArticle, child: Text("Next Article")),
          ElevatedButton(onPressed: saveToDB, child: Text('favorite')),
        ],
      ),
    );
  }
}