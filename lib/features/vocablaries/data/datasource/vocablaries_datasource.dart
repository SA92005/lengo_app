import 'package:lenguo_app/features/vocablaries/data/model/vocablaries_model.dart';

abstract class VocabulariesDataSource {
  Future<List<VocablariesModel>> getVocabulary(String category);
}
