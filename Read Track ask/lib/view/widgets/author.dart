import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/selected_list_controller.dart';
import '../theme.dart';

class Author extends StatefulWidget {
  final Function(String, String) onSelected;
  List images;
  List authors;

  Author({
    Key? key,
    required this.images,
    required this.authors,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<Author> createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  final authorController = Get.put(SelectedListController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      //padding: const EdgeInsets.all(2),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: widget.images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _onAuthorSelected(widget.images[index], widget.authors[index]);
              print('index = $index');
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image.asset(widget.images[index])),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: authorController.isContainAuthor(
                            widget.images[index], widget.authors[index])
                        ? beige
                        : Colors.grey[300],
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.authors[index],
                          style: Themes.getsubTitleStyle(black)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _onAuthorSelected(String image, String name) {
    authorController.setSelctedAuthors(image, name);
  }
}
