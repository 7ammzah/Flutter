import 'package:flutter/material.dart';

import '../theme.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.purpleAccent.withOpacity(0.5),
                backgroundImage: const AssetImage('assets/images/user.jpg'),
                radius: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hamzah Salman',
                          style: Themes.gettitleStyle(black),
                        ),
                        IconButton(
                          icon: const Icon(Icons.open_with_rounded),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'rate it ',
                        style: Themes.gettitleStyle(grey),
                      ),
                      Text(
                        ' 5 stars',
                        style: Themes.gettitleStyle(Colors.orangeAccent),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'at 11:57 - 27 May 2023s',
                            style: Themes.gettitleStyle(grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: grey.withOpacity(0.5)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'I\'m sorry, Mr. Rothfuss. For realz, actual sorry. Honestly. I tried giving your book two stars out of pity, since I so wanted to like it and Id feel bad about giving it one star and dragging down your average rating.',
                  style: Themes.getsubTitleStyle(grey),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: grey.withOpacity(0.1),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
