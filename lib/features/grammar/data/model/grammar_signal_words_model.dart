import 'package:lenguo_app/features/grammar/domain/entity/grammar_signal_words_entity.dart';

class GrammarSignalWordsModel {
  final String english;
  final String arabic;

  const GrammarSignalWordsModel({required this.english, required this.arabic});

  factory GrammarSignalWordsModel.fromJson(Map<String, dynamic> json) {
    return GrammarSignalWordsModel(
      english: json['english'],
      arabic: json['arabic'],
    );
  }

  GrammarSignalWordsEntity toEntity() {
    return GrammarSignalWordsEntity(english: english, arabic: arabic);
  }
}
