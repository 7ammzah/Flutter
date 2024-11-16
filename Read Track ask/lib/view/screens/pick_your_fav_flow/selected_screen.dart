import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/selected_author.dart';
import '../../widgets/selected_tag.dart';

class SelectedScreen extends StatelessWidget {
  final List<dynamic> tagslist;
  final List<dynamic> images;
  final List<dynamic> authors;

  const SelectedScreen({
    super.key,
    required this.tagslist,
    required this.images,
    required this.authors,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tagslist.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Genres',
                                  style: Themes.gettitleStyle(beige),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8, bottom: 0),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: tagslist.map(
                                    (tag) {
                                      return SelectedTag(
                                        text: tag,
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              SizedBox(
                                height: mediaQuery.size.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                  images.isEmpty
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Authors',
                                  style: Themes.gettitleStyle(beige),
                                ),
                              ),
                              SelectedAuthor(
                                images: images,
                                text: authors,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
