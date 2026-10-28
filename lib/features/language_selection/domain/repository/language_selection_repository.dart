import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';

abstract class LanguageSelectionRepository {
  Future<LanguageSelectionEntity?> getSelectedLanguage();

  Future<void> setSelectedLanguage(LanguageSelectionEntity language);
}
