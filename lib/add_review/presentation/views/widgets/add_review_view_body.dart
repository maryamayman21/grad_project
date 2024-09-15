import 'package:flutter/material.dart';
import 'package:grad_proj/models/review_model.dart';
import 'package:grad_proj/service/firebase_service.dart';

class AddReviewViewBody extends StatefulWidget {
  const AddReviewViewBody({super.key});

  @override
  State<AddReviewViewBody> createState() => _AddReviewViewBodyState();
}

class _AddReviewViewBodyState extends State<AddReviewViewBody> {
  double _rating = 3;
  String name = '', comment = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff1D1E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      hintText: 'Type your name',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8F959E),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'How was your experience ?',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff1D1E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        comment = value;
                      });
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      hintText: 'Describe your experience?',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8F959E),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Star',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff1D1E20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const Text('0.0'),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 5,
                        divisions: 5,
                        thumbColor: Color(0xff9775FA),
                        value: _rating,
                        activeColor: Color(0xffF5F6FA),
                        inactiveColor: Color(0xffF5F6FA),
                        onChanged: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                    ),
                    Text('5.0'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 235,
          ),
          Container(
            width: double.infinity,
            height: 75,
            color: Color(0xff9775FA),
            child: TextButton(
              onPressed: () async {
                await FirebaseService().addReview(
                  ReviewModel(
                    name: name,
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/laza-ef7a9.appspot.com/o/profile_pic.png?alt=media&token=ea4f4c4e-730b-41da-bf5b-9b6081c8e784',
                    date: '15 sep,2024',
                    comment: comment,
                    rate: _rating,
                  ),
                );
              },
              child: const Text(
                'Submit Review',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
