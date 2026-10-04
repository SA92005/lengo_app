import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';

class VocablariesModel {
  final String id;
  final String word;
  final String translation;
  final String example;
  final String exampleTranslation;
  final String imageUrl;

  VocablariesModel({
    required this.id,
    required this.word,
    required this.translation,
    required this.example,
    required this.exampleTranslation,
    required this.imageUrl,
  });
  factory VocablariesModel.fromJson(Map<String, String> json) {
    return VocablariesModel(
      id: json['id'] as String,
      word: json['word'] as String,
      translation: json['translation'] as String,
      example: json['example'] as String,
      exampleTranslation: json['example_translation'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
  VocablariesEntity toEntity() {
    return VocablariesEntity(
      id: id,
      word: word,
      translation: translation,
      example: example,
      exampleTranslation: exampleTranslation,
      imageUrl: imageUrl,
    );
  }
}
