import 'package:flutter/material.dart';
import 'package:grad_proj/home_view/widgets/brand_item.dart';
import 'package:grad_proj/home_view/widgets/product_item.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/product_view/views/item_screen.dart';
import 'package:grad_proj/service/firebase_service.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<ProductModel> future = [];
  bool isFav = false;

  int wishlistCount = 0; // Counter for wishlist items
  //as object
  List<ProductModel> get filteredProducts {
    if (_searchQuery.isEmpty) {
      return future;
    } else {
      return future.where((product) {
        return product.productName
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _toggleWishlist(ProductModel product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    // future = FirebaseService().getAllProducts();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

//accepts an object
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Add functionality to open cart here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Hello',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Welcome to Laza.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose Brand',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    BrandItem(
                      'Puma',
                      imagePath: 'assets/puma-logo 1.png',
                    ),
                    BrandItem(
                      'Nike',
                      imagePath: 'assets/nike.png',
                    ),
                    BrandItem(
                      'Fila',
                      imagePath: 'assets/Vector.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'New Arrival',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
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
      ),
    );
  }
}
