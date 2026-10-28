import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_entity.dart';
import 'package:lenguo_app/features/grammar/domain/repository/grammar_repository.dart';

@injectable
class GetGarammarUsecase {
  final GrammarRepository repository;
  GetGarammarUsecase(this.repository);
  Future<GrammarEntity> call(String name) {
    return repository.getGrammar(name);
  }
}
