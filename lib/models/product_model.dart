class ProductModel {
  final List<String> productImages;
  final String productName;
  final String productMainImage;
  final String productPrice;
  final String productDescription;
  final String productSubDescription;
  bool isFavorite = false;
  bool isOutOfStock = true;

  ProductModel(
      {required this.productImages,
      required this.isFavorite,
      required this.isOutOfStock,
      required this.productMainImage,
      required this.productName,
      required this.productPrice,
      required this.productDescription,
      required this.productSubDescription});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      productMainImage: map['mainImage'],
      productImages: List<String>.from(map['images']),
      productName: map['name'],
      productPrice: map['price'],
      productDescription: map['description'],
      productSubDescription: map['subdescription'],
      isFavorite: map['isFavorite'] ?? false,
      isOutOfStock: map['isOutOfStock'] ?? false,
    );
  }
}
