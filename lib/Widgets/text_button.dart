import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  RoundButton({Key? key,required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
    );
  }
}
