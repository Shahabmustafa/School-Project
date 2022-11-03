import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/Screen/login_screen.dart';
import 'package:untitled/Widgets/text_button.dart';

import 'home_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  FirebaseAuth aurh = FirebaseAuth.instance;
  // ImagePicker image = ImagePicker();
  // File? file;
  // String Url = '';
  // getImage()async{
  //   var img = await image.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     file = File(img!.path);
  //   });
  // }
  @override
  void dispose(){
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text('Crerate Account',style: TextStyle(color: Colors.blueGrey,fontSize: 30.0,fontWeight: FontWeight.bold),)),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: EmailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: PasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            RoundButton(
                title: 'Create Account',
                onPressed: ()async{
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: EmailController.text.toString(),
                    password: PasswordController.text.toString(),
                  );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    print('Create account');
                }
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundButton(
                title: 'Log In',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
            }
            ),
          ],
        ),
      ),
    );
  }
}
