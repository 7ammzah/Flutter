import 'package:flutter/material.dart';

import '../theme.dart';

class AuthorSearchBar extends StatefulWidget {
  final List<String> authors;
  final ValueSetter<List<String>> onSearch;

  AuthorSearchBar({required this.authors, required this.onSearch});

  @override
  _AuthorSearchBarState createState() => _AuthorSearchBarState();
}

class _AuthorSearchBarState extends State<AuthorSearchBar> {
  String _searchText = '';

  void _onChanged(String value) {
    setState(() {
      _searchText = value;
      List<String> filteredAuthors = widget.authors
          .where((author) =>
              author.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
      widget.onSearch(filteredAuthors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: grey.withOpacity(0.5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      width: double.infinity,
      child: TextField(
        textAlign: TextAlign.start,
        onChanged: _onChanged,
        style: TextStyle(color: black.withOpacity(0.5), fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'search authors',
          prefixIcon: Icon(
            Icons.search,
            color: black.withOpacity(0.5),
            size: 35,
          ),
        ),
      ),
    );
  }
}
