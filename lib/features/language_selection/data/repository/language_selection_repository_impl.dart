import 'package:injectable/injectable.dart';
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
    final model = await localDataSource.getSelectedLanguage();
    if (model == null) {
      return null;
    }
    return model.toEntity();
  }

  @override
  Future<void> setSelectedLanguage(LanguageSelectionEntity language) async {
    await localDataSource.setSelectedLanguage(
      LanguageSelectionModel.fromEntity(language),
    );
  }
}
