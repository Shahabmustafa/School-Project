import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/Time/time_screen.dart';
import 'package:untitled/Screen/profile/profile_data.dart';
import 'package:untitled/Screen/profile/profile_screen.dart';

class TimeData extends StatefulWidget {
  const TimeData({Key? key}) : super(key: key);

  @override
  State<TimeData> createState() => _TimeDataState();
}

class _TimeDataState extends State<TimeData> {
  final openTimeController = TextEditingController();
  final closeTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: openTimeController,
              decoration: InputDecoration(
                hintText: 'Time Add'
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: closeTimeController,
              decoration: InputDecoration(
                  hintText: 'Time Add'
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: ()async{
                 await FirebaseFirestore.instance.collection('time').add({
                    'openTime' : openTimeController.text.toString(),
                    'closeTime' : closeTimeController.text.toString(),
                  });
                 Navigator.push(context, MaterialPageRoute(builder: (context) => TimePage()));
                  print('add data');
                },
                child: Text('Add Data'),
            )
          ],
        ),
      ),
    );
  }
}
