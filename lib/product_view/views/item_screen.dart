import 'package:flutter/material.dart';
import 'package:grad_proj/models/product_model.dart';
import 'package:grad_proj/product_view/widgets/button_widget.dart';
import 'package:grad_proj/product_view/widgets/description_details.dart';
import 'package:grad_proj/product_view/widgets/product_image_widget.dart';
import 'package:grad_proj/product_view/widgets/product_item_listview.dart';
import 'package:grad_proj/product_view/widgets/review_section/review_details.dart';
import 'package:grad_proj/product_view/widgets/size_item_listview.dart';
import 'package:grad_proj/reviews/presentation/views/reviews_view.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImageWidget(
                mainImage: widget.productModel.productMainImage,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.productModel.productSubDescription,
                              style: Theme.of(context).textTheme.bodySmall),
                          Text(
                            'Price',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.productModel.productName,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          widget.productModel.productPrice + '\$',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                    ProductItemListview(
                      productModel: widget.productModel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Size',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          'Size Guide',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizeItemListview(),
                    Text('Description',
                        style: Theme.of(context).textTheme.bodyLarge),
                    DescriptionDetails(
                      description: widget.productModel.productDescription,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reviews',
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ReviewsView()));
                          },
                          child: Text(
                            'View All',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const ReviewDetails(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'with VAT,SD',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Text(
                            widget.productModel.productPrice + '\$',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ButtonWidget(buttonText: 'Add to cart'),
              const ButtonWidget(buttonText: 'Buy')
            ],
          ),
        ),
      ),
    );
  }
}
