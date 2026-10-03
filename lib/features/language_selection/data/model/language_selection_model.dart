import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';

class LanguageSelectionModel {
  final String languageCode;
  final String name;

  LanguageSelectionModel({required this.languageCode, required this.name});
  LanguageSelectionEntity toEntity() {
    return LanguageSelectionEntity(
      languageCode: languageCode,
      languageName: name,
    );
  }

  factory LanguageSelectionModel.fromEntity(LanguageSelectionEntity entity) {
    return LanguageSelectionModel(
      languageCode: entity.languageCode,
      name: entity.languageName,
    );
  }
}
