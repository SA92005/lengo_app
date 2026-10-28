import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';

abstract class LanguageSelectionState {}

class LanguageSelectionInitial extends LanguageSelectionState {}

class LanguageSelectionLoading extends LanguageSelectionState {}

class LanguageSelectionSuccess extends LanguageSelectionState {
  final LanguageSelectionEntity language;

  LanguageSelectionSuccess(this.language);
}

class LanguageSelectionError extends LanguageSelectionState {
  final String message;

  LanguageSelectionError(this.message);
}
