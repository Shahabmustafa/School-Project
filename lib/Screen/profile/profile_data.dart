import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  final studentIdController = TextEditingController();
  final studentNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final classNameController = TextEditingController();
  final phoneController = TextEditingController();
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
              const Text('Student Profile',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: studentIdController,
                decoration: const InputDecoration(
                  hintText: 'Student id'
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  hintText: 'Student Name'
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: fatherNameController,
                decoration: const InputDecoration(
                  hintText: 'Father Name'
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: classNameController,
                maxLength: 2,
                decoration: const InputDecoration(
                  hintText: 'Class',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Phone No',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: ()async{
                    await FirebaseFirestore.instance.collection('profile').add({
                      'id': studentIdController.text.toString(),
                      'studentName': studentNameController.text.toString(),
                      'fatherName': fatherNameController.text.toString(),
                      'class': classNameController.text.toString(),
                      'phone': phoneController.text.toString(),
                    });
                    print('Add data');
                  },
                  child: Text('Add data')
              )

            ],
          ),
        ),
      ),
    );
  }
}
