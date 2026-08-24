import 'package:lenguo_app/features/language_selection/data/model/language_selection_model.dart';

abstract class LanguageSelectionDatasource {
  Future<LanguageSelectionModel?> getSelectedLanguage();

  Future<void> setSelectedLanguage(LanguageSelectionModel language);
}
