import 'package:lenguo_app/features/phonics/domain/entities/phonics_example_entity.dart';
import 'package:lenguo_app/features/phonics/domain/entities/phonics_pronunciation_tips_entity.dart';
import 'package:lenguo_app/features/phonics/domain/entities/phonics_rule_entity.dart';

class PhonicsContentEntity {
  final PhonicsRuleEntity rule;
  final List<PhonicsExampleEntity> example;
  final List<PhonicsPronunciationTipsEntity> pronunciationTips;
  PhonicsContentEntity({
    required this.rule,
    required this.example,
    required this.pronunciationTips,
  });
}
