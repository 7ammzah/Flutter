import 'package:bmi/resault_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  int age = 18;
  int weight = 60;
  double height = 170.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.deepPurpleAccent),
        title: Text('Body Miss Index'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                M1('male'),
                const SizedBox(
                  width: 15,
                ),
                M1('female'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text('cm' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                    ],
                  ),
                  Slider(
                      min: 0.0,
                      max: 250.0,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      })
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                M2('weight'),
                const SizedBox(
                  width: 15,
                ),
                M2('age'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent),
              child: TextButton(
                onPressed: () {
                  var resault = weight / pow(height / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Resault(resault: resault, isMale: isMale, age: age);
                  }));
                },
                child: const Text(
                  'Calcaulate',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Expanded M1(String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.deepPurpleAccent
                : Color(0x9BBCA0F5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    type == 'male' ? Icons.male : Icons.female,
                    size: 90,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    type == 'male' ? 'Male' : 'Female',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded M2(String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0x9BBCA0F5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  type == 'age' ? 'Age' : 'Weight',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  type == 'age' ? '$age' : '$weight',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: type == 'age' ? age - 1 : weight - 1,
                      onPressed: () {
                        setState(() {
                          type == 'age' ? age-- : weight--;
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      heroTag: type == 'age' ? age + 1 : weight + 1,
                      onPressed: () {
                        setState(() {
                          type == 'age' ? age++ : weight++;
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
