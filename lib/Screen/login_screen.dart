import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screen/home_screen.dart';
import 'package:untitled/Widgets/text_button.dart';
import 'create_account.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth user = FirebaseAuth.instance;

  void dispose(){
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (email){
                    if(email == null || email.isEmpty){
                      return "Please Enter your Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: PasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (password){
                    if(password == null || password.isEmpty){
                      return "Please Enter your Password";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                RoundButton(
                    title: 'Log In',
                    onPressed: ()async{
                      if(_formkey.currentState!.validate()){}
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: EmailController.text.toString(),
                        password: PasswordController.text.toString(),
                      ).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())));
                    }
                ),
              ],
            ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            RoundButton(
                title: 'Create New Account',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
