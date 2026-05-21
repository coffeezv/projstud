import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/summary.dart';
import 'package:wiki_reader/ui/article_widget/article_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Избранное")),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Summary>('summaryhivebox').listenable(),
        builder: (context, box, _) {
          final summaries = box.values.toList();
          if (summaries.isEmpty) return const Center(child: Text("Список пуст"));
          
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var s in summaries) ArticleWidget(titles: '',),
              ],
            ),
          );
        },
      ),
    );
  }
}