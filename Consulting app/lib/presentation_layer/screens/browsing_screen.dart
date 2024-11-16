import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../constants/colors.dart';
import '../../constants/navigation_drawer.dart';
import '../../data_layer/models/expert.dart';
import '../widgets/profile_browsing_card.dart';
import 'expert_profile.dart';
import 'expert_profile_for_user.dart';

List<Expert> medicalExperts = [
  Expert(
    id: 1,
    firstName: 'first',
    lastName: 'last',
    email: 'first.email',
    phone: '12121',
    category: 'Med',
    path: 'assets/images/user.png',
  ),
  Expert(
    id: 1,
    firstName: 'first',
    lastName: 'last',
    email: 'first.email',
    phone: '12121',
    category: 'Med',
    path: 'assets/images/user.png',
  ),
  Expert(
    id: 1,
    firstName: 'first',
    lastName: 'last',
    email: 'first.email',
    phone: '12121',
    category: 'Med',
    path: 'assets/images/user.png',
  ),
  Expert(
    id: 1,
    firstName: 'first',
    lastName: 'last',
    email: 'first.email',
    phone: '12121',
    category: 'Med',
    path: 'assets/images/user.png',
  )
];
List<List<Expert>> allExperts = [];

class BrowsingScreen extends StatelessWidget {
  static String id = "browsing_screen";

  const BrowsingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawer(
        isExpert: false,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("browse experts"),
        backgroundColor: AppColor.moderateColor,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
      body: Container(
        //margin: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: [
            CategoryExperts(
              title: 'Experts',
              size: size,
            ),
            CategoryExperts(
              title: 'Experts',
              size: size,
            ),
            CategoryExperts(
              title: 'Experts',
              size: size,
            ),
            CategoryExperts(
              title: 'Experts',
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryExperts extends StatelessWidget {
  final String title;
  final Size size;

  const CategoryExperts({
    super.key,
    required this.title,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height / 3,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: const Icon(
                  Icons.medical_services_sharp,
                  color: AppColor.moderateColor,
                ),
                title: Text(title),
                shape: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.darkColor),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: medicalExperts.length,
                itemBuilder: (BuildContext context, int index) {
                  final expert = medicalExperts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExpertProfileForUser(
                                  /*expert: expert*/)));
                    },
                    child: ProfileBrowsingCard(
                      imgPath: 'assets/images/user.png',
                      name: 'Name',
                      category: 'Category',
                      //name: 'expert.getFullName()',
                      //category: 'expert.category',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = ['Dani', 'hella', 'obento'];

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Experts';

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
