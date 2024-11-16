import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_track_ask/view/screens/edit_profile.dart';
import '../../theme.dart';
import '../../../controller/selected_list_controller.dart';
import 'favorite_authors_screen.dart';
import 'favorite_genres_screen.dart';
import 'selected_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  final favoriteGenresScreenController =
      Get.put(SelectedListController(), permanent: true);

  static List<String> topics = [
    'Romance',
    'Sci-fi',
    'Love',
    'Comedy',
    'Mystery',
    'Action',
    'Thriller',
    'Slice of life'
  ];
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pick your favorite',
                  style: Themes.getheadingStyle(beige),
                ),
              ],
            ),
            const SizedBox(
              height: 19,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'to help us recommend you best books that you\'ll sure love,',
                          maxLines: 2,
                          style: Themes.getsubTitleStyle(black),
                        ),
                        Text(
                          'pick your favorite genres and authors.',
                          maxLines: 1,
                          style: Themes.getsubTitleStyle(black),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ], color: beige),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: white,
                      indicatorColor: white,
                      tabs: [
                        Text(
                          'Genres',
                          style: Themes.gettitleStyle(white),
                        ),
                        Text(
                          'Authors',
                          style: Themes.gettitleStyle(white),
                        ),
                        Text(
                          'Selected',
                          style: Themes.gettitleStyle(white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: grey.withOpacity(0.1),
                    height: mediaQuery.size.height * 0.61,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        const FavoriteGenresScreen(),
                        const FavoriteAuthorsScreen(),
                        SelectedScreen(
                          tagslist:
                              favoriteGenresScreenController.getSelectedTags(),
                          images: favoriteGenresScreenController
                              .getSelectedAuthorsImages(),
                          authors: favoriteGenresScreenController
                              .getSelectedAuthorsNames(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const EditProfile());
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, -3), // changes position of shadow
                    ),
                  ],
                  color: beige,
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: Themes.gettitleStyle(white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
