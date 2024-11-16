import 'package:flutter/material.dart';
import 'author_card.dart';

class SelectedAuthor extends StatelessWidget {
  List images;
  List text;

  SelectedAuthor({
    Key? key,
    required this.images,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return AuthorCard(
          imagePath: images[index],
          name: text[index],
          selectable: false,
        );
      },
    );
  }
}
