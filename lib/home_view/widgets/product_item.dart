import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/service/firebase_service.dart';

class ProductCardItem extends StatefulWidget {
  // an object
  final ProductModel productModel;

  final VoidCallback onTap;

  const ProductCardItem({
    super.key,
    required this.onTap,
    required this.productModel,
  });

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  bool isFav = false;
  @override
  void initState() {
    isFav = widget.productModel.isFavorite;
    super.initState();
  }

  onToggle() {
    isFav = !isFav;
    setState(() {});
    FirebaseService().updateProduct({'isFavorite': isFav});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.productModel.productMainImage,
                  fit: BoxFit.cover,
                  height: 260, // Adjust height to fit within grid cell
                  width: double.infinity,
                ),
              ),
              if (widget.productModel.isOutOfStock)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      'Out of Stock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productModel.productName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.productModel.productPrice,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            IconButton(
              icon: isFav
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
              onPressed: onToggle,
            ),
          ],
        ),
      ),
    );
  }
}
