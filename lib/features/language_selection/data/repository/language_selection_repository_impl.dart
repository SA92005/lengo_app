import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/features/language_selection/data/datasource/language_selecton_datasource.dart';
import 'package:lenguo_app/features/language_selection/data/model/language_selection_model.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/domain/repository/language_selection_repository.dart';

@Injectable(as: LanguageSelectionRepository)
@lazySingleton
class LanguageSelectionRepositoryImpl implements LanguageSelectionRepository {
  final LanguageSelectionDatasource localDataSource;

  LanguageSelectionRepositoryImpl({required this.localDataSource});

  @override
  Future<LanguageSelectionEntity?> getSelectedLanguage() async {
    try {
      final model = await localDataSource.getSelectedLanguage();
      if (model == null) {
        return null;
      }
      return model.toEntity();
    } on CacheException catch (e) {
      throw CacheFailure(message: e.message);
    }
  }

  @override
  Future<void> setSelectedLanguage(LanguageSelectionEntity language) async {
    try {
      await localDataSource.setSelectedLanguage(
        LanguageSelectionModel.fromEntity(language),
      );
    } on CacheException catch (e) {
      throw CacheFailure(message: e.message);
    }
  }
}
