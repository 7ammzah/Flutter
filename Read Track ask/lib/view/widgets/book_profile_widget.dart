import 'package:flutter/material.dart';
import '../theme.dart';

class BookProfileWidget extends StatefulWidget {
  const BookProfileWidget({super.key});

  @override
  State<BookProfileWidget> createState() => _BookProfileWidgetState();
}

class _BookProfileWidgetState extends State<BookProfileWidget> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = 'list[0]';

  @override
  Widget build(BuildContext context) {
    List shelfItems = ['abx', 'bxs', 'csx', 'dsx'];
    String _selectedVal = 'One';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: double.infinity,
              child: const Image(
                  image: AssetImage('assets/images/splash_screen.png')),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'The Hobbit',
                            style: Themes.gettitleStyle(black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Row(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'by  ',
                                style: Themes.gettitleStyle(grey),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'J.R.R Tolkien',
                                  style:
                                      Themes.gettitleStyle(Colors.orangeAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: grey.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                children: const [
                                  Text('4.9'),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '3,234,177 rating',
                              style: Themes.getsubTitleStyle(black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'Published at 19 June 2023',
                            style: Themes.getsubTitleStyle(grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
