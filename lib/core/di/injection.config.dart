// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:lenguo_app/features/language_selection/domain/repository/language_selection_repository.dart'
    as _i243;
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_get_selected_language_usecase.dart'
    as _i239;
import 'package:lenguo_app/features/language_selection/domain/usecase/language_selection_set_selected_language_usecase.dart'
    as _i244;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i239.LanguageSelectionGetSelectedLanguageUsecase>(
      () => _i239.LanguageSelectionGetSelectedLanguageUsecase(
        repository: gh<_i243.LanguageSelectionRepository>(),
      ),
    );
    gh.factory<_i244.LanguageSelectionSetSelectedLanguageUsecase>(
      () => _i244.LanguageSelectionSetSelectedLanguageUsecase(
        repository: gh<_i243.LanguageSelectionRepository>(),
      ),
    );
    return this;
  }
}
