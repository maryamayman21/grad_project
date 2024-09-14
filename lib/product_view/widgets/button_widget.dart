import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {},
        color: const Color(0xff9775FA),
        textColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
