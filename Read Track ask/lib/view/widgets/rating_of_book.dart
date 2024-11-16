import 'package:flutter/material.dart';

import '../theme.dart';

class RatingOfBook extends StatefulWidget {
  const RatingOfBook({super.key});

  @override
  State<RatingOfBook> createState() => _RatingOfBookState();
}

class _RatingOfBookState extends State<RatingOfBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 230,
      width: MediaQuery.of(context).size.width * 0.70,
      padding: const EdgeInsets.all(2),
      child: Container(
        width: double.infinity,
        color: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text(
                    '5 / 5',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text('79%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text(
                    '4 / 5',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text('74%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text(
                    '3 / 5',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text('69%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text(
                    '2 / 5',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text('55%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text(
                    '1 / 5',
                    style: TextStyle(fontWeight: FontWeight.bold, color: black),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: grey.withOpacity(0.1),
                  ),
                  child: const Center(
                      child: Text('43%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: black))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
