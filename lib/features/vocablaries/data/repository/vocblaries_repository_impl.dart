import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/vocablaries/data/datasource/vocablaries_datasource.dart';
import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';
import 'package:lenguo_app/features/vocablaries/domain/repository/vocablaries_repository.dart';

@Injectable(as: VocabulariesRepository)
class VocabulariesRepositoryImpl implements VocabulariesRepository {
  final VocabulariesDataSource dataSource;

  VocabulariesRepositoryImpl({required this.dataSource});

  @override
  Future<List<VocablariesEntity>> getVocabulary(String category) async {
    final models = await dataSource.getVocabulary(category);
    return models.map((model) => model.toEntity()).toList();
  }
}
