import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/domain/repository/language_selection_repository.dart';

@injectable
class LanguageSelectionGetSelectedLanguageUsecase {
  final LanguageSelectionRepository repository;
  LanguageSelectionGetSelectedLanguageUsecase({required this.repository});
  Future<LanguageSelectionEntity?> call() async {
    return await repository.getSelectedLanguage();
  }
}
