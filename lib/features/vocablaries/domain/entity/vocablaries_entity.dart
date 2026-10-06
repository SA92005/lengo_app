class VocablariesEntity {
  final String id;
  final String word;
  final String translation;
  final String example;
  final String exampleTranslation;
  final String imageUrl;

  const VocablariesEntity({
    required this.id,
    required this.word,
    required this.translation,
    required this.example,
    required this.exampleTranslation,
    required this.imageUrl,
  });
}
