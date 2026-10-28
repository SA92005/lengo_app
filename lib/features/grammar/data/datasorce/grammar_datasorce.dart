import 'package:lenguo_app/features/grammar/data/model/grammar_model.dart';

abstract class GrammarDataSource {
  Future<GrammarModel> getGrammar(String name);
}
