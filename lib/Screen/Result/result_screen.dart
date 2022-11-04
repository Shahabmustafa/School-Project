import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/Result/result_data.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('result').get(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder:(context,index){
                  var data = snapshot.data!.docs[index];
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(label: Text(
                            'Subject',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        )),
                        DataColumn(label: Text(
                            'Marks',
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
                          DataCell(Text('Islamyat')),
                          DataCell(Text(data['Islamayat'])),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Pak-Studty')),
                          DataCell(Text(data['Pak_study'])),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Science')),
                          DataCell(Text(data['Science'])),

                        ]),
                        DataRow(cells: [
                          DataCell(Text('Total Marks',style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['Total'])),
                        ]),
                      ],
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsData()));
                    }, child: Text('Add Data'))
                  ],
                );
                });
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
