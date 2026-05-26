import 'package:flutter/material.dart';

class FavoriteListItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const FavoriteListItemWidget({super.key, required this.title, required this.onTap});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 10,
        child: Text("Hello"),
      )
    );
  }
}