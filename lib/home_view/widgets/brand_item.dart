import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  final String brandName;
  final String imagePath;

  const BrandItem(this.brandName, {super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        icon: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
        label: Text(brandName),
      ),
    );
  }
}
