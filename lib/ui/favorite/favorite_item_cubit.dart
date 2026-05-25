import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/article_widget/article_widget.dart';

class FavItemState {}

class FavItemChosen extends FavItemState {
  final Article article;
  FavItemChosen({required this.article});
}

class FavItemInitial extends FavItemState {
  
}

class FavItemCubit extends Cubit<FavItemCubit> {
  FavItemCubit() : super(FavItemInitial() as FavItemCubit);
  
  void setFavItem(Article a) {
    final state = FavItemChosen(article: a);
    emit(state as FavItemCubit);
  }
}

class FavItemView extends StatelessWidget {
  const FavItemView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBuilder<FavItemCubit, FavItemState>(
      builder: (context, state) {
        return switch (state) {
          FavItemChosen(article: var a) => ArticleWidget(
            titles: '',
            extract: '',
          ),
          _ => Text("Something went wrong"),
        };
      },
    );
  }
}
