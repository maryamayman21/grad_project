import 'package:flutter/material.dart';
import 'package:grad_proj/home_view/widgets/product_item.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/product_view/views/item_screen.dart';
import 'package:grad_proj/service/firebase_service.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<Wishlistscreen> {
  List<ProductModel> future = [];
  int wishlistCount = 0;
  void _navigateToProductDetails(ProductModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemScreen(
          productModel: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: FirebaseService().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var productList = snapshot.data as List<ProductModel>;
                    future = productList;
                    return GridView.builder(
                        itemCount: future.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.4,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCardItem(
                            productModel: future[index],
                            onTap: () =>
                                _navigateToProductDetails(future[index]),
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }
}
