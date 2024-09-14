import 'package:flutter/material.dart';
import 'package:grad_proj/reviews/presentation/views/widgets/reviews_view_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Reviews'),
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
        ),
      ),
      body: SingleChildScrollView(
        child: ReviewsViewBody(),
      ),
    );
  }
}
