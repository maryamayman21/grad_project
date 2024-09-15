import 'package:flutter/material.dart';
import 'package:grad_proj/product_view/widgets/icon_widget.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key, required this.mainImage});
  final String mainImage;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(mainImage),
          fit: BoxFit.cover,
        )),
      ),
      Positioned(
          top: 40,
          left: 15,
          child: IconWidget(
              radius: 30,
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              })),
      Positioned(
        top: 40,
        left: 330,
        child: IconWidget(
            radius: 30, icon: Icons.card_travel_outlined, onPressed: () {}),
      ),
      Positioned(
        top: 410,
        left: 170,
        child: CircleAvatar(
          backgroundColor: const Color(0xffFFFFFF).withOpacity(0.2),
          radius: 50,
          child: CircleAvatar(
              backgroundColor: const Color(0xffFFFFFF).withOpacity(0.2),
              radius: 30,
              child: Image.asset(
                'assets/nike.png',
                fit: BoxFit.cover,
                height: 40,
              )),
        ),
      ),
    ]);
  }
}
