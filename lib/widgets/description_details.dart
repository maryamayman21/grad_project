import 'package:flutter/material.dart';

class DescriptionDetails extends StatelessWidget {
  const DescriptionDetails({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ReadMoreText(
        comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Pellentesque malesuada eget vitae amet. Mauris non nibh auctor, "
            "suscipit libero nec, bibendum ipsum. Lorem ipsum dolor sit amet, "
            "consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur "
            "adipiscing elit. Pellentesque malesuada eget vitae amet. Mauris non "
            "nibh auctor, suscipit libero nec, bibendum ipsum.",
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String comment;

  const ReadMoreText({required this.comment});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Create a TextPainter to check if text overflows
        final textPainter = TextPainter(
          text: TextSpan(
            text: widget.comment,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          maxLines: 3,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        // Check if the text exceeds 3 lines
        final bool isOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If not expanded, limit text to 3 lines and show 'Read more'
            Text(
              widget.comment,
              maxLines: _isExpanded ? null : 3,
              overflow:
                  _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // Show 'Read more' if text is overflowing
            if (isOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? 'Read less' : 'Read more',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
