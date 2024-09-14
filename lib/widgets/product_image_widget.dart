import 'package:flutter/material.dart';
import 'package:grad_proj/widgets/icon_widget.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        width: double.infinity,
        height: 500,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/Rectangle 568.png',
          ),
          fit: BoxFit.cover,
        )),
      ),
      Positioned(
          top: 40,
          left: 15,
          child:
              IconWidget(radius: 30, icon: Icons.arrow_back, onPressed: () {})),
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
