import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../screens/reading_flow/reading_screen.dart';
import '../screens/book_profile.dart';
import 'button.dart';

import '../theme.dart';

class BookProgress extends StatefulWidget {
  String bookTitle;
  String authorName;
  String imgUrl;
  double percent;

  BookProgress({
    required this.bookTitle,
    required this.authorName,
    required this.imgUrl,
    required this.percent,
    super.key,
  });

  @override
  State<BookProgress> createState() => _BookProgressState();
}

class _BookProgressState extends State<BookProgress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(() => const BookProfile());
      }),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: greyShadow,
          color: white,
        ),
        child: Row(
          children: [
            Container(
              // height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: Image(
                    image: AssetImage(widget.imgUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.bookTitle,
                    style: Themes.gettitleStyle(black),
                  ),
                  Text(
                    widget.authorName,
                    style: Themes.getsubTitleStyle(grey),
                  ),
                  LinearPercentIndicator(
                    width: 150,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10,
                    trailing: Text('${(widget.percent * 100).toString()} %'),
                    percent: widget.percent,
                    barRadius: const Radius.circular(10),
                    progressColor: Colors.orangeAccent,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.height * 0.285,
                    child: MyButton(
                      label: 'Continue Reading',
                      backgroundColor: beige,
                      textColor: white,
                      onTap: () async {
                        // final file = await PDFApi.pickFile();
                        // if (file == null) return;

                        Get.to(() => ReadingScreen(
                            file: File('assets/pdfs/pharmacy mangemnet.pdf')));
                      },
                      borderradius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
