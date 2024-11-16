import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_dialog.dart';

class BookmarkCard extends StatelessWidget {
  final int pageNumber;
  String? title;

  BookmarkCard({
    super.key,
    required this.pageNumber,
    this.title,
  }) {
    title = title ?? 'Bookmark $pageNumber';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            GestureDetector(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return EditDialog(
                        text: title,
                        size: size,
                        pageNumber: pageNumber,
                        userEdit: UserEdit.bookmark,
                      );
                    });
              },
              child: Container(
                margin: EdgeInsets.only(right: size.width * 0.05),
                decoration: BoxDecoration(
                  color: AppColors.selectedColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: greyShadow,
                ),
                padding: const EdgeInsets.all(20),
                width: size.width * 0.85,
                child: Text(
                  title!,
                  softWrap: true,
                  style: Themes.getsubTitleStyle(black),
                ),
              ),
            ),
            CircleAvatar(
              radius: pageNumber >= 10000 ? 25 : 20,
              backgroundColor: Colors.orangeAccent.withAlpha(180),
              child: Text(
                pageNumber.toString(),
                style: Themes.getsubTitleStyle(black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
