import 'package:flutter/material.dart';
import 'package:grad_proj/widgets/review_section/profile_photo.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfilePhoto(),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username
                  Text('Ronald Richards',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 4.0),
                  // Date with icon
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 14.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4.0),
                      Text('13 sep, 2020',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text('4.6', style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 4.0),
                    Text('rating',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4.5.round() ? Icons.star : Icons.star_border,
                      color: Colors.yellow[700],
                      size: 16.0,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text('''Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
Pellentesque malesuada eget vitae amet. 
Mauris non nibh auctor, suscipit libero nec, bibendum ipsum.''',
            maxLines: 3, // Maximum 3 lines
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
