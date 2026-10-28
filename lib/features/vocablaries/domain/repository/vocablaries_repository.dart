import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';

abstract class VocabulariesRepository {
  Future<List<VocablariesEntity>> getVocabulary(String category);
}
