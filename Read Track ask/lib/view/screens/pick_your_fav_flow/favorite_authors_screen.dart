import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/selected_list_controller.dart';
import '../../widgets/author_card.dart';
import '../../widgets/author_search.dart';

class FavoriteAuthorsScreen extends StatefulWidget {
  const FavoriteAuthorsScreen({super.key});

  @override
  State<FavoriteAuthorsScreen> createState() => _FavoriteAuthorsScreenState();
}

class _FavoriteAuthorsScreenState extends State<FavoriteAuthorsScreen> {
  final favoriteAuthorsScreenController =
      Get.put(SelectedListController(), permanent: true);

  bool _selected = false;
  String _searchText = '';
  List<String> images = [
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/book.jpg',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
    'assets/images/splash_screen.png',
  ];

  List<String> authors = [
    'Image hamzah',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
    'Image 6',
    'Image 7',
    'Image 8',
    'Image 9',
    'Image 10',
    'Image 11',
    'Image 12',
    'Image 13',
    'Image 14',
  ];
  List<String> filteredAuthors = [];
  _onAuthorSelected(String image, String author) {
    favoriteAuthorsScreenController.setSelctedAuthors(image, author);
    setState(() {
      _selected = !_selected;
    });
  }

  void _onSearch(List<String> filteredItems) {
    setState(() {
      filteredAuthors = filteredItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
      height: size.height * 0.65,
      width: double.infinity,
      child: Column(
        children: [
          AuthorSearchBar(
            authors: authors,
            onSearch: _onSearch,
          ),
          SizedBox(
            height: 330,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
              ),
              itemCount: filteredAuthors.isNotEmpty
                  ? filteredAuthors.length
                  : images.length,
              itemBuilder: (BuildContext context, int index) {
                final authorIndex = authors.indexOf(filteredAuthors.isNotEmpty
                    ? filteredAuthors[index]
                    : authors[index]);

                return GestureDetector(
                  onTap: () {
                    _onAuthorSelected(
                        images[authorIndex], authors[authorIndex]);
                  },
                  child: AuthorCard(
                    imagePath: images[authorIndex],
                    name: authors[authorIndex],
                    selectable: true,
                    selected: favoriteAuthorsScreenController.isContainAuthor(
                      images[authorIndex],
                      authors[authorIndex],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
