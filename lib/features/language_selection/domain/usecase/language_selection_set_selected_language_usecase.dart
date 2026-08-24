import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/domain/repository/language_selection_repository.dart';

@injectable
class LanguageSelectionSetSelectedLanguageUsecase {
  final LanguageSelectionRepository repository;
  LanguageSelectionSetSelectedLanguageUsecase({required this.repository});
  Future<void> call(LanguageSelectionEntity language) async {
    return await repository.setSelectedLanguage(language);
  }
}
