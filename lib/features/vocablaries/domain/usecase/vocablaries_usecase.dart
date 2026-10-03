import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';
import 'package:lenguo_app/features/vocablaries/domain/repository/vocablaries_repository.dart';

@injectable
class GetVocabulary {
  final VocabulariesRepository repository;

  GetVocabulary(this.repository);

  Future<List<VocablariesEntity>> call(String category) {
    return repository.getVocabulary(category);
  }
}
