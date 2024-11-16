import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);
  
  final String payload;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String payload = '';
  void initState(){
    super.initState();
    payload = widget.payload;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: purpleClr,
        title: Text(
          payload.toString().split('|')[0],
          style: TextStyle(
            color: Get.isDarkMode ? white : darkGreyClr,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello Hero ^-^',
                style: TextStyle(
                    color: Get.isDarkMode ? white : darkGreyClr,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'You have a new Reminder!',
                style: TextStyle(
                    color: Get.isDarkMode ? white : darkGreyClr,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: purpleClr,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.text_format),
                            SizedBox(width: 20,),
                            Text('Title'),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text(payload.toString().split('|')[0]),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(Icons.description),
                            SizedBox(height: 20,),
                            Text(payload.toString().split('|')[1]),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.description),
                            SizedBox(height: 20,),
                            Text(payload.toString().split('|')[2]),
                          ],
                        )
                      ],
                      
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
