import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/profile/profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('profile').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context,index){
                  var data = snapshot.data!.docs[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(child: Text('Student Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                      SizedBox(
                        height: 30.0,
                      ),
                      DataTable(
                        columns: const [
                          DataColumn(label: Text(
                              'Profile',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                          DataColumn(label: Text(
                              'Detail',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('id')),
                            DataCell(Text(data['id'])),

                          ]),
                          DataRow(cells: [
                            DataCell(Text('Student Name')),
                            DataCell(Text(data['studentName'])),

                          ]),
                          DataRow(cells: [
                            DataCell(Text('Father Name')),
                            DataCell(Text(data['fatherName'])),

                          ]),
                          DataRow(cells: [
                            DataCell(Text('Class')),
                            DataCell(Text(data['class'])),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Phone No')),
                            DataCell(Text(data['phone'])),
                          ]),
                        ],
                      ),
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
