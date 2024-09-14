import 'package:flutter/material.dart';
import 'package:grad_proj/reviews/presentation/views/reviews_view.dart';
import 'package:grad_proj/widgets/button_widget.dart';
import 'package:grad_proj/widgets/description_details.dart';
import 'package:grad_proj/widgets/product_image_widget.dart';
import 'package:grad_proj/widgets/product_item_listview.dart';
import 'package:grad_proj/widgets/review_section/review_details.dart';
import 'package:grad_proj/widgets/size_item_listview.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

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
              const ProductImageWidget(),
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
                          Text('Mens Printed PullOver Hoodie',
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
                        Text('Nike Club Fleece',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          '120 ' + '\$',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                    const ProductItemListview(),
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
                    const DescriptionDetails(
                      description: 'Lorem',
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
                            ' 25 \$',
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
