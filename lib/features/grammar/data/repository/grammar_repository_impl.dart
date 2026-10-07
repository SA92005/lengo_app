import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/features/grammar/data/datasorce/grammar_datasorce.dart';
import 'package:lenguo_app/features/grammar/domain/entity/grammar_entity.dart';
import 'package:lenguo_app/features/grammar/domain/repository/grammar_repository.dart';

@Injectable(as: GrammarRepository)
class GrammarRepositoryImpl implements GrammarRepository {
  final GrammarDataSource dataSource;

  GrammarRepositoryImpl({required this.dataSource});

  @override
  Future<GrammarEntity> getGrammar(String name) async {
    try {
      final model = await dataSource.getGrammar(name);

      return model.toEntity();
    } on CacheException catch (e) {
      throw CacheFailure(message: e.message);
    }
  }
}
