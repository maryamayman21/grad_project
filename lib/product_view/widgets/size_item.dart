import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({super.key, required this.size});
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      width: 60,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 193, 193, 197).withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Text(
          size,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
