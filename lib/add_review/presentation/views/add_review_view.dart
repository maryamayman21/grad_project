import 'package:flutter/material.dart';
import 'package:grad_proj/add_review/presentation/views/widgets/add_review_view_body.dart';

class AddReviewView extends StatelessWidget {
  const AddReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add Review'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: AddReviewViewBody(),
    );
  }
}
