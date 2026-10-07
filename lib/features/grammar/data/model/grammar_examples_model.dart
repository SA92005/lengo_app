import 'package:lenguo_app/features/grammar/domain/entity/grammar_examples_entity.dart';

class GrammarExamplesModel {
  final String english;
  final String arabic;

  const GrammarExamplesModel({required this.english, required this.arabic});

  factory GrammarExamplesModel.fromJson(Map<String, dynamic> json) {
    return GrammarExamplesModel(
      english: json['english'],
      arabic: json['arabic'],
    );
  }

  GrammarExamplesEntity toEntity() {
    return GrammarExamplesEntity(english: english, arabic: arabic);
  }
}
