import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/models/review_model.dart';

class FirebaseService {
  Future<List<ProductModel>> getAllProducts() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<ProductModel> products = [];

    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('products').get();
      for (var doc in querySnapshot.docs) {
        products.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error retrieving products: $e');
    }
    return products;
  }

  Future<List<ReviewModel>> getAllReviews() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<ReviewModel> reviews = [];

    try {
      QuerySnapshot querySnapshot = await firestore.collection('reviews').get();
      for (var doc in querySnapshot.docs) {
        reviews.add(ReviewModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error retrieving reviews: $e');
    }
    return reviews;
  }
}
