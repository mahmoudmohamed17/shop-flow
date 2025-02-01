// this is for handling the review data
// for each segment returened by the api response

class ReviewModel {
  final int starsCount;
  final String reviewerName;
  final String comment;
  final String date;

  ReviewModel(
      {required this.starsCount,
      required this.reviewerName,
      required this.comment,
      required this.date});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        starsCount: json['rating'] ?? 3,
        reviewerName: json['reviewerName'] ?? 'reviewerName',
        comment: json['comment'] ?? 'comment',
        date: json['date'] ?? 'date');
  }
}
