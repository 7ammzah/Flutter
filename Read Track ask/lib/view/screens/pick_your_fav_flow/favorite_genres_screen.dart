import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/selected_list_controller.dart';
import '../../widgets/tag.dart';
import '../../theme.dart';
import '../../widgets/button.dart';

class FavoriteGenresScreen extends StatefulWidget {
  const FavoriteGenresScreen({super.key});

  @override
  State<FavoriteGenresScreen> createState() => _FavoriteGenresScreenState();
}

var myButtonController = Get.put(MyButton());

class _FavoriteGenresScreenState extends State<FavoriteGenresScreen> {
  final favoriteGenresScreenController =
      Get.put(SelectedListController(), permanent: true);

  static final List<String> _tagsList = [
    'Tag1',
    'Tag2',
    'Tag3',
    'Romance',
    'Sci-fi',
    'Love',
    'Comedy',
    'Mystery',
    'Action',
    'Thriller',
    'Slice of life'
        'Romance1',
    'Sci-fi1',
    'Love1',
    'Comedy1',
    'Mystery1',
    'Action1',
    'Thriller1',
    'Slice of life1'
    // ...
  ];

  List<String> selectedTags = _tagsList;
  void _onTagSelected(String tag) {
    favoriteGenresScreenController.setSelectedtags(tag);
  }

  @override
  Widget build(BuildContext context) {
    String _searchText = '';
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 0),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.5),
                ),
              ],
            ),
            child: TextField(
              textAlign: TextAlign.start,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  if (_searchText.isEmpty) {
                    selectedTags = _tagsList;
                  } else {
                    selectedTags = _tagsList
                        .where((item) => item
                            .toLowerCase()
                            .contains(_searchText.toLowerCase()))
                        .toList();
                  }
                });
              },
              style: TextStyle(color: black.withOpacity(0.5), fontSize: 20),
              decoration: InputDecoration(
                filled: true,
                fillColor: white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'search genres',
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                  size: 35,
                ),
              ),
            ),
          ),
          Container(
            height: 330,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: selectedTags.map(
                  (tag) {
                    return Tag(text: tag, onSelected: _onTagSelected);
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
