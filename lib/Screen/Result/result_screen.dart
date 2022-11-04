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
      body: Column(
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
                DataCell(Text('')),

              ]),
              DataRow(cells: [
                DataCell(Text('Urdu')),
                DataCell(Text('')),

              ]),
              DataRow(cells: [
                DataCell(Text('Maths')),
                DataCell(Text('')),

              ]),
              DataRow(cells: [
                DataCell(Text('Islamyat')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pak-Studty')),
                DataCell(Text('')),
              ]),
              DataRow(cells: [
                DataCell(Text('Science')),
                DataCell(Text('')),

              ]),
              DataRow(cells: [
                DataCell(Text('Total Marks',style: TextStyle(fontWeight: FontWeight.bold),)),
                DataCell(Text('')),
              ]),
            ],
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsData()));
          }, child: Text('Add Data'))
        ],
      ),
    );
  }
}
