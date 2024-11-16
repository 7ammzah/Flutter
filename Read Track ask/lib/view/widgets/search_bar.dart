import 'package:flutter/material.dart';

import '../theme.dart';

class SearchBar extends StatefulWidget {
  SearchBar({required this.hintText, super.key, required this.items});
  String hintText;
  final List<String> items;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<String> selectedTags = [];

  String _searchText = '';

  List<String> getfilteredItems() {
    if (_searchText.isEmpty) {
      return widget.items;
    } else {
      return widget.items
          .where(
              (item) => item.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 56,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   boxShadow: [
        //     BoxShadow(
        //       color: grey.withOpacity(0.5),
        //     ),
        //   ],
        // ),
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        width: double.infinity,
        child: TextField(
          textAlign: TextAlign.start,
          onChanged: (value) {
            setState(() {
              getfilteredItems();
            });
          },
          style: TextStyle(color: black.withOpacity(0.5), fontSize: 20),
          decoration: InputDecoration(
            filled: true,
            fillColor: white,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(50.0),
            //   borderSide: BorderSide.none,
            // ),
            hintText: widget.hintText,
            prefixIcon: Icon(
              Icons.search,
              color: black.withOpacity(0.5),
              size: 30,
            ),
            suffixIcon: IconButton(
              splashRadius: 30,
              icon: const Icon(Icons.clear),
              onPressed: () => setState(() {
                _searchText = '';
              }),
            ),
          ),
        ),
      ),
    );
  }
}
