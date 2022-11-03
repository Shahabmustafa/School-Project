import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiaryData extends StatefulWidget {
  const DiaryData({Key? key}) : super(key: key);

  @override
  State<DiaryData> createState() => _DiaryDataState();
}

class _DiaryDataState extends State<DiaryData> {
  final englishController = TextEditingController();
  final urduController = TextEditingController();
  final mathsController = TextEditingController();
  final pakstudyController = TextEditingController();
  final islamyatController = TextEditingController();
  final scienceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Student Profile',
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: englishController,
              decoration: const InputDecoration(
                  hintText: 'English'
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: urduController,
              decoration: const InputDecoration(
                  hintText: 'Urdu'
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: mathsController,
              decoration: const InputDecoration(
                  hintText: 'Maths'
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: pakstudyController,
              decoration: const InputDecoration(
                hintText: 'Pak-Study',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: islamyatController,
              decoration: const InputDecoration(
                hintText: 'Islamyat',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: scienceController,
              decoration: const InputDecoration(
                hintText: 'Science',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: ()async{
                  await FirebaseFirestore.instance.collection('subject').add({
                    'English': englishController.text.toString(),
                    'Urdu': urduController.text.toString(),
                    'Maths': mathsController.text.toString(),
                    'Pak-Study': pakstudyController.text.toString(),
                    'Islamyat': islamyatController.text.toString(),
                    'Science': scienceController.text.toString(),
                  });
                  print('Add data');
                },
                child: Text('Add Data')
            ),
          ],
        ),
      ),
      ),
    );
  }
}
