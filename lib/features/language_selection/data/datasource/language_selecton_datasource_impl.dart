import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
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
    try {
      final languageCode = sharedPreferences.getString(languageKey);
      if (languageCode == null) {
        return null;
      }
      return LanguageSelectionModel(
        languageCode: languageCode,
        name: languageCode == 'ar' ? 'Arabic' : 'English',
      );
    } catch (e) {
      throw CacheException(message: 'Failed to get selected language');
    }
  }

  @override
  Future<void> setSelectedLanguage(LanguageSelectionModel language) async {
    try {
      await sharedPreferences.setString(languageKey, language.languageCode);
    } catch (e) {
      throw CacheException(message: 'Failed to set selected language');
    }
  }
}

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
