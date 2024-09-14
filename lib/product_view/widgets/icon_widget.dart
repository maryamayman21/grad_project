import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key, this.onPressed, required this.icon, required this.radius});
  final void Function()? onPressed;
  final IconData icon;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        radius: radius,
        child: Icon(icon, color: Colors.black, size: 25),
      ),
      onPressed: onPressed,
    );
  }
}
