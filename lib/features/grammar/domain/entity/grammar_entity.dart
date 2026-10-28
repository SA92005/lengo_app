import 'package:lenguo_app/features/grammar/domain/entity/grammar_examples_entity.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_signal_words_entity.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_structure_entity.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_verb_rules_entity.dart';

class GrammarEntity {
  final String name;
  final String nameAr;
  final String explanation;
  final List<String> uses;
  final GrammarStructureEntity structure;
  final List<GrammarVerbRulesEntity> verbRules;
  final List<GrammarExamplesEntity> examples;
  final List<GrammarSignalWordsEntity> signalWords;

  GrammarEntity({
    required this.name,
    required this.nameAr,
    required this.explanation,
    required this.uses,
    required this.structure,
    required this.verbRules,
    required this.examples,
    required this.signalWords,
  });
}
