class PhonicsPracticeEntity {
  final String id;
  final String type;
  final String question;
  final String questionAr;
  final List<String> options;
  final String correctAnswer;

  PhonicsPracticeEntity({
    required this.id,
    required this.type,
    required this.question,
    required this.questionAr,
    required this.options,
    required this.correctAnswer,
  });
}
