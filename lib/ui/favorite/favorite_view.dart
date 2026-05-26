import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/summary.dart';
import 'package:wiki_reader/ui/article_widget/article_widget.dart';
import 'package:hive/hive.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key, required this.summaries, required this.box, required Null Function() onTap});
  final List<Article?> summaries;
  final Box<Article> box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Избранное")),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Summary>('summaryhivebox').listenable(),
        builder: (context, state, _) {
          final summaries = box.values.toList();
          if (summaries.isEmpty) return const Center(child: Text("Список пуст"));
          
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var s in summaries) ArticleWidget(
                  titles: s.titles, 
                  extract: s.extract,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}