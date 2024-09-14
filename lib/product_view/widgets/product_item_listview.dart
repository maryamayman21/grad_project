import 'package:flutter/material.dart';
import 'package:grad_proj/widgets/product_item.dart';

class ProductItemListview extends StatelessWidget {
  const ProductItemListview({super.key});
  final List<String> productItems = const [
    'assets/hoodie_(1).png',
    'assets/hoodie_(2).png',
    'assets/hoodie_(3).png',
    'assets/hoodie_(4).png'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItem(
            imageUrl: productItems[index],
          );
        },
        itemCount: productItems.length,
      ),
    );
  }
}
