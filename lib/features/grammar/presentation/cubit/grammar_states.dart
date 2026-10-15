import 'package:lenguo_app/features/grammar/domain/entity/grammar_entity.dart';

abstract class GrammarState {}

class GrammarInitial extends GrammarState {}

class GrammarLoading extends GrammarState {}

class GrammarSuccess extends GrammarState {
  final GrammarEntity grammar;

  GrammarSuccess(this.grammar);
}

class GrammarError extends GrammarState {
  final String message;

  GrammarError(this.message);
}
