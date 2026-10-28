import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/core/language/current_language.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_get_selected_language_usecase.dart';
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_set_selected_language_usecase.dart';

import 'language_selection_state.dart';

// @injectable
// @Injectable(as: CurrentLanguage)
@lazySingleton
class LanguageSelectionCubit extends Cubit<LanguageSelectionState>
    implements CurrentLanguage {
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
    } on CacheFailure catch (e) {
      emit(LanguageSelectionError(e.message));
    } catch (e) {
      emit(
        LanguageSelectionError('Something went wrong. Please try again later.'),
      );
    }
  }

  Future<void> setSelectedLanguage(LanguageSelectionEntity language) async {
    emit(LanguageSelectionLoading());

    try {
      await setSelectedLanguageUseCase(language);
      emit(LanguageSelectionSuccess(language));
    } on CacheFailure catch (e) {
      emit(LanguageSelectionError(e.message));
    } catch (e) {
      emit(
        LanguageSelectionError('Something went wrong. Please try again later.'),
      );
    }
  }

  @override
  String? get languageCode {
    final state = this.state;

    if (state is LanguageSelectionSuccess) {
      return state.language.languageCode;
    }

    return null;
  }
}
