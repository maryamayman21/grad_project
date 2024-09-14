import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
        radius: 30, backgroundImage: AssetImage('assets/profile_pic.png'));
  }
}
