import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../theme.dart';

class ChallengeCard extends StatefulWidget {
  String challengeName;
  String type;
  int read;
  int goal;
  int daysLeft;
  double? percent;

  ChallengeCard({
    super.key,
    required this.challengeName,
    required this.type,
    required this.read,
    required this.goal,
    required this.daysLeft,
  }) {
    percent = read / goal;
  }

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      width: size.width * 0.75,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: greyShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.challengeName,
            style: Themes.gettitleStyle(black),
          ),
          Text(
            '${widget.daysLeft} days left',
            style: Themes.gettitleStyle(grey),
          ),
          LinearPercentIndicator(
            // width: 140,
            animation: true,
            animationDuration: 1000,
            lineHeight: 10,
            leading: Text('${widget.read}/${widget.goal}'),
            trailing: Text('${(widget.percent! * 100).toPrecision(2)} %'),
            percent: widget.percent!,
            barRadius: const Radius.circular(10),
            progressColor: Colors.orangeAccent,
          ),
        ],
      ),
    );
  }
}
