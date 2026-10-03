import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_get_selected_language_usecase.dart';
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_set_selected_language_usecase.dart';

import 'language_selection_state.dart';

@injectable
class LanguageSelectionCubit extends Cubit<LanguageSelectionState> {
  final LanguageSelectionGetSelectedLanguageUsecase getSelectedLanguageUseCase;
  final LanguageSelectionSetSelectedLanguageUsecase setSelectedLanguageUseCase;

  LanguageSelectionCubit({
    required this.getSelectedLanguageUseCase,
    required this.setSelectedLanguageUseCase,
  }) : super(LanguageSelectionInitial());

  Future<void> getSelectedLanguage() async {
    emit(LanguageSelectionLoading());

    try {
      final language = await getSelectedLanguageUseCase();

      if (language == null) {
        emit(LanguageSelectionInitial());
      } else {
        emit(LanguageSelectionSuccess(language));
      }
    } catch (e) {
      emit(LanguageSelectionError(e.toString()));
    }
  }

  Future<void> setSelectedLanguage(LanguageSelectionEntity language) async {
    emit(LanguageSelectionLoading());

    try {
      await setSelectedLanguageUseCase(language);

      emit(LanguageSelectionSuccess(language));
    } catch (e) {
      emit(LanguageSelectionError(e.toString()));
    }
  }
}
