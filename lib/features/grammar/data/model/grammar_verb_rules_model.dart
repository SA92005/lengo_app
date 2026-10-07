import 'package:lenguo_app/features/grammar/domain/entity/grammar_verb_rules_entity.dart';

class GrammarVerbRulesModel {
  final String rule;
  final String form;
  final List<String> examples;

  const GrammarVerbRulesModel({
    required this.rule,
    required this.form,
    required this.examples,
  });

  factory GrammarVerbRulesModel.fromJson(Map<String, dynamic> json) {
    return GrammarVerbRulesModel(
      rule: json['rule'],
      form: json['form'],
      examples: List<String>.from(json['examples']),
    );
  }

  GrammarVerbRulesEntity toEntity() {
    return GrammarVerbRulesEntity(rule: rule, form: form, examples: examples);
  }
}
