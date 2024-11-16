import 'package:flutter/material.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/view/widgets/button.dart';

class EditProgress extends StatefulWidget {
  const EditProgress({super.key});

  @override
  State<EditProgress> createState() => _EditProgressState();
}

class _EditProgressState extends State<EditProgress> {
  double _val = 0;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded)),
              ],
            ),
          ),
          title: const Center(
            child: Text('Edit Progress'),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update page number',
                style: Themes().getheadingStyle(beige),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: grey.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            '3/4%',
                            style: Themes().getsubTitleStyle(black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Slider(
                            activeColor: Colors.amber,
                            value: _val,
                            onChanged: (val) {
                              setState(() {
                                _val = val;
                              });
                            },
                            max: 10,
                            min: 0.0,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: grey.withOpacity(0.2),
                        ),
                        width: 40,
                        child: Center(
                          child: Text(
                            '75%',
                            style: Themes().getsubTitleStyle(black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                //height: 15,
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: grey.withOpacity(0.2),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Update Stauts',
                style: Themes().getheadingStyle(beige),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15,
                ),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Add to',
                        style: Themes().gettitleStyle(black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        height: 40,
                        width: 105,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: grey.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey.withOpacity(0.2)),
                    ),
                    const Text(' or '),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: grey.withOpacity(0.2)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                label: 'Start Reading',
                backgroundColor: beige,
                textColor: white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
