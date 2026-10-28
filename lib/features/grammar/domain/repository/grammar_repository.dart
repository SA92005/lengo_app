import 'package:lenguo_app/features/grammar/domain/entity/grammar_entity.dart';

abstract class GrammarRepository {
  Future<GrammarEntity> getGrammar(String name);
}
