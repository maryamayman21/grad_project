import 'package:flutter/material.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/product_view/widgets/product_item.dart';

class ProductItemListview extends StatelessWidget {
  const ProductItemListview({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductItem(
            imageUrl: productModel.productImages[index],
          );
        },
        itemCount: productModel.productImages.length,
      ),
    );
  }
}
