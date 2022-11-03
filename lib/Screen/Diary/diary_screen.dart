import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/Diary/diary_data.dart';
import 'package:untitled/Widgets/text_button.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Diary')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('subject').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                var data = snapshot.data!.docs[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(child: Text('Student Diary',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                    SizedBox(
                      height: 30.0,
                    ),
                    DataTable(
                      columns: const [
                        DataColumn(label: Text(
                            'Subject',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )),
                        DataColumn(label: Text(
                            'Description',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('English')),
                          DataCell(Text(data['English'])),

                        ]),
                        DataRow(cells: [
                          DataCell(Text('Urdu')),
                          DataCell(Text(data['Urdu'])),

                        ]),
                        DataRow(cells: [
                          DataCell(Text('Maths')),
                          DataCell(Text(data['Maths'])),

                        ]),
                        DataRow(cells: [
                          DataCell(Text('Pak-Study')),
                          DataCell(Text(data['Pak-Study'])),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Islamayat')),
                          DataCell(Text(data['Islamyat'])),
                        ]),DataRow(cells: [

                          DataCell(Text('Science')),
                          DataCell(Text(data['Science'])),
                        ]),
                      ],
                    ),

                  ],
                );
              },
            );
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


