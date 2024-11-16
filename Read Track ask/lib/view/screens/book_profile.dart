import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:read_track_ask/view/screens/edit_progress.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/view/widgets/button.dart';

import '../widgets/book_profile_widget.dart';
import '../widgets/rating_of_book.dart';
import '../widgets/reviews.dart';
import '../widgets/tag.dart';

class BookProfile extends StatefulWidget {
  const BookProfile({super.key});

  @override
  State<BookProfile> createState() => _BookProfileState();
}

class _BookProfileState extends State<BookProfile> {
  List items = [
    'Romance',
    'Sci-fi',
    'Love',
    'Comedy',
    'Mystery',
    'Action',
    'Thriller',
    'Slice of life'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded)),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProgress());
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const BookProfileWidget(),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  label: 'Start Reading',
                  backgroundColor: beige,
                  textColor: white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: items.map(
                          (tag) {
                            return Tag(text: tag, onSelected: (tag) {});
                          },
                        ).toList(),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 5,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          'Harry has been burdened with a dark, dangerous and seemingly impossible task: that of locating and destroying Voldemort\'s remaining Horcruxes. Never has Harry felt so alone, or faced a future so full of shadows. But Harry must somehow find within himself the strength to complete the task he has been given. He must leave the warmth, safety and companionship of The Burrow and follow without fear or hesitation the inexorable path laid out for him...',
                          style: Themes().getsubTitleStyle(grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey.withOpacity(0.5)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const RatingOfBook(),
                const SizedBox(
                  height: 20,
                ),
                const Reviews(),
                const Reviews(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
