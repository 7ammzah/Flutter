import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/selected_list_controller.dart';
import 'book_profile.dart';
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/book_progress.dart';
import '../widgets/tag.dart';

enum DiscoverType { forYou, friendsBooks }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _val = 0.0;
  final forYouTagsController =
      Get.put(SelectedListController(), permanent: true);

  List<BookItem> books = const [
    BookItem(
        Imgurl: 'assets/images/splash_screen.png',
        bookTitle: 'title 2',
        bookAuthor: 'author 2'),
    BookItem(
        Imgurl: 'assets/images/splash_screen.png',
        bookTitle: 'title 3',
        bookAuthor: 'author 3'),
    BookItem(
        Imgurl: 'assets/images/splash_screen.png',
        bookTitle: 'title 4',
        bookAuthor: 'author 4'),
    BookItem(
        Imgurl: 'assets/images/splash_screen.png',
        bookTitle: 'title 5',
        bookAuthor: 'author 5'),
  ];

  List<BookItem> booksProgress = const [
    BookItem(
      Imgurl: 'assets/images/splash_screen.png',
      bookTitle: 'title 2',
      bookAuthor: 'author 2',
    ),
    BookItem(
      Imgurl: 'assets/images/splash_screen.png',
      bookTitle: 'title 3',
      bookAuthor: 'author 3',
    ),
    BookItem(
      Imgurl: 'assets/images/splash_screen.png',
      bookTitle: 'title 4',
      bookAuthor: 'author 4',
    ),
  ];

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

  List<ChallengeCard> challanges = [
    ChallengeCard(
      challengeName: 'August Goal',
      type: 'book',
      read: 2,
      goal: 3,
      daysLeft: 8,
    ),
    ChallengeCard(
      challengeName: 'August Goal',
      type: 'book',
      read: 2,
      goal: 3,
      daysLeft: 8,
    ),
    ChallengeCard(
      challengeName: 'August Goal',
      type: 'book',
      read: 2,
      goal: 3,
      daysLeft: 8,
    ),
    ChallengeCard(
      challengeName: 'August Goal',
      type: 'book',
      read: 2,
      goal: 3,
      daysLeft: 8,
    ),
  ];
  List<String> filteredAuthors = [];

  _onAuthorSelected(String image, String author) {
    // favoriteAuthorsScreenController.setSelctedAuthors(image, author);
    // setState(() {
    //   _selected = !_selected;
    // });
  }

  void _onSearch(List<String> filteredItems) {
    setState(() {
      filteredAuthors = filteredItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: Themes.getheadingStyle(beige),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          // height: 20,
                          child: SearchBar(
                            hintText: 'Search title or author',
                            items: [],
                          )),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.filter_list),
                    //   iconSize: 50,
                    // )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ChallengesSection(challanges: challanges),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const CurrentlyReadingSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildForYou(DiscoverType.forYou),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildForYou(DiscoverType.friendsBooks),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForYou(DiscoverType type) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type == DiscoverType.forYou ? 'For You' : 'Friends Books',
              style: Themes.gettitleStyle(beige),
            ),
            Text(
              'see all',
              style: Themes.gettitleStyle(grey),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        type == DiscoverType.friendsBooks
            ? Container()
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 8,
                    children: forYouTagsController.selectedTags.map(
                      (tag) {
                        return Tag(text: tag, onSelected: (tag) {});
                      },
                    ).toList(),
                  ),
                ),
              ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 250,
          child: ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return _buildbook(books[index]);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _buildbook(BookItem book) {
    return GestureDetector(
      onTap: () => Get.to(() => const BookProfile()),
      child: Container(
        padding: const EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width * 0.40,
        height: MediaQuery.of(context).size.height * 0.33,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: Image.asset(
                    book.Imgurl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              book.bookTitle,
              style: Themes.gettitleStyle(black),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              book.bookAuthor,
              style: Themes.getsubTitleStyle(grey),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentlyReadingSection extends StatelessWidget {
  const CurrentlyReadingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Your Currentlly Readings',
              style: Themes.gettitleStyle(beige),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BookProgress(
          bookTitle: 'First Title',
          authorName: 'Hamzah Hamzah',
          imgUrl: 'assets/images/splash_screen.png',
          percent: 0.5,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BookProgress(
          bookTitle: 'Second Title',
          authorName: 'Hamzah Hamzah',
          imgUrl: 'assets/images/book.jpg',
          percent: 0.1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        BookProgress(
          bookTitle: 'Third Title',
          authorName: 'Hamzah Hamzah',
          imgUrl: 'assets/images/splash_screen.png',
          percent: 0.7,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        MyButton(
          label: 'see all',
          backgroundColor: AppColors.secondaryColor,
          textColor: black.withOpacity(0.5),
          onTap: () {},
        ),
      ],
    );
  }
}

class ChallengesSection extends StatelessWidget {
  const ChallengesSection({
    super.key,
    required this.challanges,
  });

  final List<ChallengeCard> challanges;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Challenges',
              style: Themes.gettitleStyle(beige),
            ),
            Text(
              'see all',
              style: Themes.gettitleStyle(grey),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.all(2),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return challanges[index];
            },
            itemCount: challanges.length,
          ),
        ),
      ],
    );
  }
}

class BookItem {
  final String Imgurl;
  final String bookTitle;
  final String bookAuthor;

  const BookItem({
    required this.Imgurl,
    required this.bookTitle,
    required this.bookAuthor,
  });
}
