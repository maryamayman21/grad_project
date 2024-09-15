import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                reviewModel.image,
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text(
                  reviewModel.name,
                  style: TextStyle(
                    color: Color(0xff1D1E20),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      color: Color(0xff8F959E),
                      size: 12,
                    ),
                    SizedBox(width: 5),
                    Text(
                      reviewModel.date,
                      style: TextStyle(
                        color: Color(0xff8F959E),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            RatingWidget(
              rating: reviewModel.rate,
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          reviewModel.comment,
          maxLines: 3,
          style: TextStyle(
            color: Color(0xff8F959E),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$rating',
                style: TextStyle(
                  color: Color(0xff1D1E20),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'rating',
                style: TextStyle(
                  color: Color(0xff8F959E),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            starRating(
              rating: rating,
              index: 0,
            ),
            starRating(
              rating: rating,
              index: 1,
            ),
            starRating(
              rating: rating,
              index: 2,
            ),
            starRating(
              rating: rating,
              index: 3,
            ),
            starRating(
              rating: rating,
              index: 4,
            ),
          ],
        ),
      ],
    );
  }
}

class starRating extends StatelessWidget {
  const starRating({
    super.key,
    required this.rating,
    required this.index,
  });
  final double rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Icon(
      index < rating.floor() ? Icons.star : Icons.star_border_outlined,
      size: 12,
      color: index < rating.floor() ? Color(0xffFF981F) : Color(0xff8F959E),
    );
  }
}
