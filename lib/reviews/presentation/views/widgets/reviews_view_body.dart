import 'package:flutter/material.dart';
import 'package:grad_proj/models/review_model.dart';
import 'package:grad_proj/reviews/presentation/views/widgets/add_review_button.dart';
import 'package:grad_proj/reviews/presentation/views/widgets/review_item.dart';
import 'package:grad_proj/service/firebase_service.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({super.key});

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  var reviews;
  @override
  void initState() {
    super.initState();
  }

  refreshDate() {
    setState(() {});
  }

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
          FutureBuilder(
              future: FirebaseService().getAllReviews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var reviewsList = snapshot.data as List<ReviewModel>;
                  return ListView.builder(
                    itemCount: reviewsList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ReviewItem(
                        reviewModel: reviewsList[index],
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
