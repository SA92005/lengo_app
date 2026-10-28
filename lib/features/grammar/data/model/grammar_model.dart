import 'package:lenguo_app/features/grammar/data/model/grammar_examples_model.dart';
import 'package:lenguo_app/features/grammar/data/model/grammar_signal_words_model.dart';
import 'package:lenguo_app/features/grammar/data/model/grammar_structure_model.dart';
import 'package:lenguo_app/features/grammar/data/model/grammar_verb_rules_model.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_entity.dart';

class GrammarModel {
  final String name;
  final String nameAr;
  final String explanation;
  final List<String> uses;
  final GrammarStructureModel structure;
  final List<GrammarVerbRulesModel> verbRules;
  final List<GrammarSignalWordsModel> signalWords;
  final List<GrammarExamplesModel> examples;

  const GrammarModel({
    required this.name,
    required this.nameAr,
    required this.explanation,
    required this.uses,
    required this.structure,
    required this.verbRules,
    required this.signalWords,
    required this.examples,
  });

  factory GrammarModel.fromJson(Map<String, dynamic> json) {
    return GrammarModel(
      name: json['name'],
      nameAr: json['nameAr'],
      explanation: json['explanation'],
      uses: List<String>.from(json['uses']),
      structure: GrammarStructureModel.fromJson(json['structure']),
      verbRules: (json['verbRules'] as List)
          .map((e) => GrammarVerbRulesModel.fromJson(e))
          .toList(),
      signalWords: (json['signalWords'] as List)
          .map((e) => GrammarSignalWordsModel.fromJson(e))
          .toList(),
      examples: (json['examples'] as List)
          .map((e) => GrammarExamplesModel.fromJson(e))
          .toList(),
    );
  }

  GrammarEntity toEntity() {
    return GrammarEntity(
      name: name,
      nameAr: nameAr,
      explanation: explanation,
      uses: uses,
      structure: structure.toEntity(),
      verbRules: verbRules.map((e) => e.toEntity()).toList(),
      signalWords: signalWords.map((e) => e.toEntity()).toList(),
      examples: examples.map((e) => e.toEntity()).toList(),
    );
  }
}
