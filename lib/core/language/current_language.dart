import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';

abstract class CurrentLanguage {
  String? get languageCode;
}

@module
abstract class CurrentLanguageModule {
  CurrentLanguage currentLanguage(LanguageSelectionCubit cubit) => cubit;
}
