import 'package:flutter/material.dart';
import 'package:grad_proj/reviews/presentation/views/widgets/add_review_button.dart';
import 'package:grad_proj/reviews/presentation/views/widgets/review_item.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '245 Reviews',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(
                        0xff1D1E20,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1D1E20),
                        ),
                      ),
                      SizedBox(width: 5),
                      Row(
                        children: [
                          starRating(
                            rating: 4.8,
                            index: 0,
                          ),
                          starRating(
                            rating: 4.8,
                            index: 1,
                          ),
                          starRating(
                            rating: 4.8,
                            index: 2,
                          ),
                          starRating(
                            rating: 4.8,
                            index: 3,
                          ),
                          starRating(
                            rating: 4.8,
                            index: 4,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              AddReviewButton(),
            ],
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: ReviewItem(),
              );
            },
          ),
        ],
      ),
    );
  }
}
