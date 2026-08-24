import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/language_selection/data/datasource/language_selecton_datasource.dart';
import 'package:lenguo_app/features/language_selection/data/model/language_selection_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LanguageSelectionDatasource)
@lazySingleton
class LanguageSelectionDatasourceImpl implements LanguageSelectionDatasource {
  final SharedPreferences sharedPreferences;
  LanguageSelectionDatasourceImpl({required this.sharedPreferences});

  static const String languageKey = 'selected_language';

  @override
  Future<LanguageSelectionModel?> getSelectedLanguage() async {
    final languageCode = sharedPreferences.getString(languageKey);
    if (languageCode == null) {
      return null;
    }
    return LanguageSelectionModel(
      languageCode: languageCode,
      name: languageCode == 'ar' ? 'Arabic' : 'English',
    );
  }

  @override
  Future<void> setSelectedLanguage(LanguageSelectionModel language) async {
    await sharedPreferences.setString(languageKey, language.languageCode);
  }
}
