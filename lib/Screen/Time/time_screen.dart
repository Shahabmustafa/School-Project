import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Time')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('time').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
                itemBuilder: (context,index){
                  var time = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            Text('School Time',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                          ],
                        ),
                         SizedBox(
                           height: 30.0,
                         ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Row(
                               children: [
                                 Text('Open School',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                                 SizedBox(
                                   width: 20.0,
                                 ),
                                 Text(time['openTime'],style: TextStyle(fontSize: 30.0)),
                               ],
                             ),
                             SizedBox(
                               height: 10.0,
                             ),
                              Row(
                                children: [
                                  Text('Close School',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(time['closeTime'],style: TextStyle(fontSize: 30.0)),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                }
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
