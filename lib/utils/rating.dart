class RatingUtils {
  static int getAvarageRating({double score}) {
    return ((score / 10) * 5).round();
  }
}
