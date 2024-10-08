class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String comment;
  final double rate;
  ReviewModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.comment,
      required this.rate});

  factory ReviewModel.fromJson(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'],
      image: map['image'],
      date: map['date'],
      comment: map['comment'],
      rate: map['rate'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'comment': comment,
      'rate': rate,
    };
  }
}
