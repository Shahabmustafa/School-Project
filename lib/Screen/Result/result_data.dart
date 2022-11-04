import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultsData extends StatefulWidget {
  const ResultsData({Key? key}) : super(key: key);

  @override
  State<ResultsData> createState() => _ResultsDataState();
}

class _ResultsDataState extends State<ResultsData> {

  final englishResultController = TextEditingController();
  final urduResultController = TextEditingController();
  final mathsResultController = TextEditingController();
  final pakstudyResultController = TextEditingController();
  final islamyatResultController = TextEditingController();
  final scienceResultController = TextEditingController();
  // late int result;
  late int sum;
  // final totalResultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Result Data',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              controller: englishResultController,
              decoration: InputDecoration(
                hintText: "English"
              ),
            ),
            TextFormField(
              controller: urduResultController,
              decoration: InputDecoration(
                  hintText: "Urdu"
              ),
            ),
            TextFormField(
              controller: mathsResultController,
              decoration: InputDecoration(
                  hintText: "Maths"
              ),
            ),
            TextFormField(
              controller: islamyatResultController,
              decoration: InputDecoration(
                  hintText: "Islamayat"
              ),
            ),
            TextFormField(
              controller: pakstudyResultController,
              decoration: InputDecoration(
                  hintText: "Pak_Study"
              ),
            ),
            TextFormField(
              controller: scienceResultController,
              decoration: InputDecoration(
                  hintText: "Science"
              ),
            ),
            // TextFormField(
            //   controller: totalResultController,
            //   decoration: InputDecoration(
            //       hintText: "Total"
            //   ),
            // ),
            ElevatedButton(onPressed: ()async{
              await FirebaseFirestore.instance.collection('result').add({
                'English' : englishResultController.text,
                'Urdu' : urduResultController.text,
                'Maths' : mathsResultController.text,
                'Islamayat' : islamyatResultController.text,
                'Pak_study' : pakstudyResultController.text,
                'Science' : scienceResultController.text,
                'Total' : int.parse(englishResultController.text) + int.parse(urduResultController.text) + int.parse(mathsResultController.text) + int.parse(islamyatResultController.text) +  int.parse(pakstudyResultController.text) + int.parse(scienceResultController.text),
              });
              // sum = int.parse(englishResultController.text) + int.parse(urduResultController.text) +  int.parse(mathsResultController.text) + int.parse(islamyatResultController.text) +  int.parse(pakstudyResultController.text) + int.parse(scienceResultController.text);
              // result = sum;
              // totalResultController.text = result.toString();
              print('add data');
            }, child: Text('Add Data'))
          ],
        ),
      ),
    );
  }
}
