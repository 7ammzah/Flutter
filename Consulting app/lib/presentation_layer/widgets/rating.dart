import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: GestureDetector(
        onTap: () {
          Rate();
        },
        child: const Text(
            'Rate Me!',
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueAccent,
            fontFamily: 'Pacifico'
          ),
        ),
      ),
    );
  }

  Future Rate() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0XFF8FA8FF),
                    Color(0XFF8FD1FF),
                    Color(0XFF8FD1FF),
                    Color(0XAABFD7FF),
                    Color(0XAABFD7AF),
                  ],
                )),
            height: 120,
            width: 360,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Add Some Stars',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"),
                  ),
                  Center(
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 0,
                      allowHalfRating: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      updateOnDrag: true,
                      onRatingUpdate: (rating){
                        //TODO ....
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

