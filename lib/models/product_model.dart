class ProductModel {
  final List<String> productImages;
  final String productName;
  final String productPrice;
  final String productDescription;
  final String productSubDescription;
  final bool isFavorite;

  const ProductModel(
      {required this.productImages,
      this.isFavorite = false,
      required this.productName,
      required this.productPrice,
      required this.productDescription,
      required this.productSubDescription});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      productImages: List<String>.from(map['images']),
      productName: map['name'],
      productPrice: map['price'],
      productDescription: map['description'],
      productSubDescription: map['subdescription'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}
