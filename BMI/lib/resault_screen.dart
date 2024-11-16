import 'package:flutter/material.dart';

class Resault extends StatelessWidget {
  const Resault({
    super.key,
    required this.resault,
    required this.isMale,
    required this.age,
  });

  final double resault;
  final bool isMale;
  final int age;

  String getHealth() {
    String healthResault = '';
    if (resault < 18.5) {
      healthResault = 'UnderWeight!';
    } else if (resault >= 18.5 && resault <= 24.9) {
      healthResault = 'Normal';
    } else if (resault >= 25.0 && resault <= 29.9) {
      healthResault = 'OverWeight!';
    } else {
      healthResault = 'Obese!';
    }
    return healthResault;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.deepPurpleAccent),
        title: const Text(
          'Resault!',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                isMale ? 'Gender : Male' : 'Gender : Female',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Age : $age',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Resault : ${resault.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Healthness : ${getHealth()}',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
